% === Square Root Transformation ===
% 조건: sqrt(x) 는 x ≥ 0 이어야 함

data_sqrt = data_zscaled; % 복사본 생성
sqrt_applied_columns = {};  % 변환된 열 목록 저장

for i = 1:width(data_sqrt)
    col = data_sqrt{:, i};
    
    % 제곱근 변환은 음수가 아닌 값에서만 적용 가능
    if all(col >= 0)
        data_sqrt{:, i} = sqrt(col);
        sqrt_applied_columns{end+1} = data_sqrt.Properties.VariableNames{i};
    end
end

% 변환된 열 이름 출력
disp('=== 제곱근 변환이 적용된 열 목록 ===');
disp(sqrt_applied_columns);
disp('제곱근 변환 완료');
