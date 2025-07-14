% ============================================
% EMOTION CLASSIFIER - MATLAB LAMA (R2013 ke bawah)
% Tanpa toolbox modern
% ============================================

% --- Step 1: Baca file CSV manual
fid = fopen('emotions.csv');
fgetl(fid);  % Lewati header
dataRaw = textscan(fid, '%q %f', 'Delimiter', ',');
fclose(fid);

texts = dataRaw{1};     % Cell array of teks
labels = dataRaw{2};    % Label angka 0?5

% --- Step 2: Ubah label ke teks
emotionLabels = {'sadness', 'joy', 'love', 'anger', 'fear', 'surprise'};
labelText = emotionLabels(labels + 1);

% --- Step 3: Preprocessing manual (lowercase & hilangkan tanda baca)
for i = 1:length(texts)
    texts{i} = lower(texts{i});                         % lowercase
    texts{i} = regexprep(texts{i}, '[^a-zA-Z ]', '');   % hapus tanda baca
end

% --- Step 4: Bangun kamus kata (vocabulary)
allWords = {};
for i = 1:length(texts)
    words = strsplit(texts{i});
    allWords = [allWords words];  % Gabungkan semua kata
end
vocab = unique(allWords);  % Kamus unik
nWords = length(vocab);
nDocs = length(texts);

% --- Step 5: Representasi Bag-of-Words (dokumen x kata)
X = zeros(nDocs, nWords);
for i = 1:nDocs
    words = strsplit(texts{i});
    for j = 1:length(words)
        idx = find(strcmp(vocab, words{j}));
        if ~isempty(idx)
            X(i, idx) = X(i, idx) + 1;
        end
    end
end

% --- Step 6: One-hot encoding label
numClass = 6;
Y = zeros(nDocs, numClass);
for i = 1:nDocs
    Y(i, labels(i) + 1) = 1;
end

% --- Step 7: Train/test split
idx = randperm(nDocs);
nTrain = round(0.8 * nDocs);
XTrain = X(idx(1:nTrain), :)';
YTrain = Y(idx(1:nTrain), :)';
XTest = X(idx(nTrain+1:end), :)';
YTest = Y(idx(nTrain+1:end), :)';

% --- Step 8: Latih ANN
net = patternnet(10);
net = train(net, XTrain, YTrain);

% --- Step 9: Evaluasi model
YTestPred = net(XTest);
[~, predIdx] = max(YTestPred, [], 1);
[~, actualIdx] = max(YTest, [], 1);
accuracy = sum(predIdx == actualIdx) / length(actualIdx);
fprintf('\nAkurasi testing: %.2f%%\n', accuracy * 100);

% --- Step 10: Prediksi teks baru (contoh)
teksBaru = 'I feel afraid and anxious';
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
fprintf('Prediksi emosi teks baru: %s\n', emotionLabels{idxPred});
