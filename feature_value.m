% モード設定
mode = 1; % 0: HOG特徴抽出なし 1: HOG特徴抽出あり

switch mode
    case 0
        trai_data=trai'; % 訓練データ
        test_data=test'; % テストデータ
        T2 = 0;
    case 1
        cellSize = [2 2]; % [2 2], [4 4], [8 8]
        for ii = 1 : ndata 
            img=reshape(trai(:,ii), [16 16]); %trailを16行16列配列に形状変更
            trai_data(ii,:) = extractHOGFeatures(img, 'CellSize', cellSize);%HOG特徴を出力しtraildataにする
        end
        tic
        for ii = 1 : ndata 
            img=reshape(test(:,ii), [16 16]);
            test_data(ii,:) = extractHOGFeatures(img, 'CellSize', cellSize);
        end
        T2=toc;
end
