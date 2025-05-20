% === Log 변환 적용 (Standardized 데이터 기반) ===
% 조건: log 변환은 음수가 아닌 값만 허용됨 (즉, log1p(x) = log(1+x)에서 x >= -1)

data_log = data_zscaled; % 복사본 생성
log_applied_columns = {};  % 변환된 열 목록 저장

for i = 1:width(data_zscaled)
    col = data_zscaled{:, i};
    min_val = min(col);
    
    % log1p를 적용할 수 있는 조건: 모든 값이 -1 이상
    if min_val >= -1
        data_log{:, i} = log1p(col);  % log(1 + x)
        log_applied_columns{end+1} = data_zscaled.Properties.VariableNames{i};
    end
end

% 변환된 열 목록 출력
disp('=== Log 변환이 적용된 열 목록 ===');
disp(log_applied_columns);

% 결과 확인용 메시지
disp('Log 변환 완료 (log1p: log(1+x))');
