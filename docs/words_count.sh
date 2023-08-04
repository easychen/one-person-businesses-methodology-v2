#!/bin/bash

# 初始化字符计数器
total_chars=0

# 读取 SUMMARY.md 中的文件列表
files=$(grep -o '\[.*\](\(.*\))' SUMMARY.md | sed -e 's/\[.*\](\(.*\))/\1/')

# 遍历文件列表
for file in $files
do
    # 忽略 SUMMARY.md 文件
    if [ "$file" != "SUMMARY.md" ]; then
        # 使用wc -m命令计算文件中的字符数，并将结果添加到总字符数中
        chars_in_file=$(wc -m < "$file")
        total_chars=$((total_chars + chars_in_file))
    fi
done

# 打印总字符数
echo "Total characters in markdown files mentioned in SUMMARY.md: $total_chars"