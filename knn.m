% k-最近傍分類モデルの作成
for k=1:2:15 % 最近傍の数
knn_model = fitcknn(trai_data, trai_label, 'NumNeighbors', k);%trail_dataは訓練行列,trail_labelは対応する文字
% モデルの交差確認
cv_knn_model = crossval(knn_model);%knnmodelから交差検出されたknnmodel(cv_knn_model)を返す
L = kfoldLoss(cv_knn_model); % 推定誤識別率

% テストデータを用いたモデルの評価
tic
predict_label = predict(knn_model, test_data); % モデルを使ってテストデータを分類
T3 = toc;
%accuracy = sum(predict_label == test_label)/ndata % 識別率
misclass_rate = sum(predict_label ~= test_label)/ndata; % 誤識別率
%CM = confusionmat(test_label, predict_label); % 混同行列の計算
k
fprintf(1,'misclassification rate (CV): %2.3f\n', L*100);%交差確認の誤識別率
fprintf(1,'misclassification rate (test data): %2.3f\n', misclass_rate*100);%テストデータを用いた時の誤識別率
fprintf(1,'classification time per sample: %f[s]\n', (T1 + T2 + T3)/ndata);
end
