% === Normalization (Min-Max Scaling) ===
% 모든 열에 대해 [0, 1] 범위로 스케일링

data_minmax = data_zscore;  % 복사본 생성

for i = 1:width(data_minmax)
    col = data_minmax{:, i};
    min_val = min(col);
    max_val = max(col);
    
    % NaN 방지
    if max_val > min_val
        data_minmax{:, i} = (col - min_val) / (max_val - min_val);
    else
        data_minmax{:, i} = zeros(size(col));  % 값이 모두 같은 경우 0으로 대체
    end
end

disp('모든 Feature에 대해 Min-Max Normalization 완료');
