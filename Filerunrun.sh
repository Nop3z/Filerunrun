#!/bin/bash

# 检查是否提供了目录参数
if [ -z "$1" ]; then
  echo "使用方法: $0 目录路径"
  exit 1
fi

DIRECTORY=$1

# 检查提供的目录是否存在
if [ ! -d "$DIRECTORY" ]; then
  echo "错误: 目录 $DIRECTORY 不存在"
  exit 1
fi

OUTPUT_FILE="output.txt"

# 定义递归函数以提取文件名
extract_files() {
  local DIR=$1
  for ITEM in "$DIR"/*; do
    if [ -f "$ITEM" ]; then
      echo "$(basename "$ITEM")" >> "$OUTPUT_FILE"
    elif [ -d "$ITEM" ]; then
      extract_files "$ITEM"
    fi
  done
}

# 提取目录及其子目录中的全部文件名
echo "目录 $DIRECTORY 及其子目录下的文件名：" > "$OUTPUT_FILE"
extract_files "$DIRECTORY"
echo "文件名已
`
