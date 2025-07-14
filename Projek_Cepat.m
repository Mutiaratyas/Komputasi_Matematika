clc;
clear;

disp('>> LANGKAH 1: Membaca dan sampling data dari CSV besar...');
fid = fopen('emotions.csv');
fgetl(fid);  % Lewati header
dataRaw = textscan(fid, '%q %f', 'Delimiter', ',');
fclose(fid);

allTexts = dataRaw{1};
allLabels = dataRaw{2};
totalData = length(allTexts);
disp(['   Jumlah total data: ', num2str(totalData)]);

% --- Sampling acak 22.000 data dari 400.000
rng(1);  % Untuk hasil acak yang tetap
sampleSize = 22000;
idxSample = randperm(totalData, sampleSize);
texts = allTexts(idxSample);
labels = allLabels(idxSample);
nDocs = length(texts);

% -------------------------------
disp('>> LANGKAH 2: Konversi label angka ke teks...');
emotionLabels = {'sadness', 'joy', 'love', 'anger', 'fear', 'surprise'};
labelText = emotionLabels(labels + 1);

% -------------------------------
disp('>> LANGKAH 3: Preprocessing teks...');
allWords = {};
processedTexts = cell(nDocs, 1);
for i = 1:nDocs
    teks = lower(texts{i});
    teks = regexprep(teks, '[^a-zA-Z ]', '');
    words = strsplit(teks);
    allWords = [allWords words];
    processedTexts{i} = words;
    
    if mod(i, 1000) == 0
        fprintf('   - Preprocessed %d/%d dokumen\n', i, nDocs);
    end
end

% -------------------------------
disp('>> LANGKAH 4: Ambil 500 kata paling umum...');
[uniqueWords, ~, idxWords] = unique(allWords);
freq = accumarray(idxWords', 1);
[~, sortIdx] = sort(freq, 'descend');
topWords = uniqueWords(sortIdx(1:min(500, length(sortIdx))));
vocab = topWords;
nWords = length(vocab);
disp(['   Jumlah kata dalam kamus: ', num2str(nWords)]);

% -------------------------------
disp('>> LANGKAH 5: Bangun fitur Bag-of-Words...');
X = zeros(nDocs, nWords);
for i = 1:nDocs
    words = processedTexts{i};
    for j = 1:length(words)
        idx = find(strcmp(vocab, words{j}));
        if ~isempty(idx)
            X(i, idx) = X(i, idx) + 1;
        end
    end
    if mod(i, 1000) == 0
        fprintf('   - Dibuat fitur %d/%d dokumen\n', i, nDocs);
    end
end

% -------------------------------
disp('>> LANGKAH 6: One-hot encoding label...');
Y = zeros(nDocs, 6);
for i = 1:nDocs
    Y(i, labels(i) + 1) = 1;
end

% -------------------------------
disp('>> LANGKAH 7: Split 20rb train, 2rb test...');
XTrain = X(1:20000, :)';
YTrain = Y(1:20000, :)';
XTest = X(20001:22000, :)';
YTest = Y(20001:22000, :)';

% -------------------------------
disp('>> LANGKAH 8: Training Neural Network...');
net = patternnet(5);  % Hidden layer ringan
net.trainParam.epochs = 200;
net.trainParam.showWindow = false;
tic;
net = train(net, XTrain, YTrain);
toc;
disp('   >> Training selesai');

% -------------------------------
disp('>> LANGKAH 9: Evaluasi model...');
YTestPred = net(XTest);
[~, predIdx] = max(YTestPred, [], 1);
[~, actualIdx] = max(YTest, [], 1);
accuracy = sum(predIdx == actualIdx) / length(actualIdx);
fprintf('   >> Akurasi testing: %.2f%%\n', accuracy * 100);

% -------------------------------
disp('>> LANGKAH 10: Prediksi emosi teks baru...');
teksBaru = 'I feel very happy and grateful';
disp(['   Kalimat: "', teksBaru, '"']);
teksBaru = lower(teksBaru);
teksBaru = regexprep(teksBaru, '[^a-zA-Z ]', '');
wordsBaru = strsplit(teksBaru);
XBaru = zeros(nWords, 1);
for j = 1:length(wordsBaru)
    idx = find(strcmp(vocab, wordsBaru{j}));
    if ~isempty(idx)
        XBaru(idx) = XBaru(idx) + 1;
    end
end
YBaru = net(XBaru);
[~, idxPred] = max(YBaru);
fprintf('   >> Prediksi emosi teks baru: %s\n', emotionLabels{idxPred});
