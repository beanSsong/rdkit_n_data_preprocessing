% === Standardization (Z-score Normalization) ===
% 평균 0, 표준편차 1로 정규화

data_zscaled = data_zscore;  % 복사본 생성

for i = 1:width(data_zscaled)
    col = data_zscaled{:, i};
    mu = mean(col);
    sigma = std(col);
    
    % NaN 방지
    if sigma > 0
        data_zscaled{:, i} = (col - mu) / sigma;
    else
        data_zscaled{:, i} = zeros(size(col));  % 분산이 0일 경우
    end
end

disp('모든 Feature에 대해 Z-score Standardization 완료');
