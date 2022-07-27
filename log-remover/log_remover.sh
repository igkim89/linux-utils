#!/bin/bash
# 일정 기간이 지난 파일 제거
# ex) REMOVE_LIST=(/home/igkim/tmp,5)
#     /home/igkim/tmp 경로 내에 존재하는 파일 중, 최근 수정일이 5일 이상 지난 경우 파일 제거

# Input : DIRECTORY_PATH,DAYS
# shellcheck disable=SC2054
REMOVE_LIST=(
    /home/igkim/utils/tmp,3
    /home/igkim/utils/tmp2,5
)


for i in "${REMOVE_LIST[@]}"
do
    DIR=$(echo $i | cut -d ',' -f1)
    DAYS=$(echo $i | cut -d ',' -f2)

    /usr/bin/find $DIR -type f -mtime +$DAYS -exec rm {} +
done