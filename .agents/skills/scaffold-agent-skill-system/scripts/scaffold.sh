#!/usr/bin/env bash

# Script: scaffold.sh
# Dùng để khởi tạo cấu trúc thư mục skill mới theo repo hiện tại.

set -euo pipefail

if [ -z "${1:-}" ]; then
  echo "Vui lòng truyền tên skill."
  echo "Cách dùng: bash .agents/skills/scaffold-agent-skill-system/scripts/scaffold.sh my-new-skill"
  exit 1
fi

SKILL_NAME="$1"

if ! [[ "$SKILL_NAME" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
  echo "Tên skill không hợp lệ: '$SKILL_NAME'"
  echo "Quy tắc: lowercase + kebab-case (vd: my-new-skill)."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
SKILL_DIR="$REPO_ROOT/.agents/skills/$SKILL_NAME"

echo "Đang tạo cấu trúc cho skill: $SKILL_NAME"
echo "Thư mục đích: $SKILL_DIR"

mkdir -p "$SKILL_DIR/examples" "$SKILL_DIR/templates" "$SKILL_DIR/verification" "$SKILL_DIR/scripts"

if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
  cat <<EOF > "$SKILL_DIR/SKILL.md"
---
name: $SKILL_NAME
description: Mô tả ngắn gọn về $SKILL_NAME
---
# SKILL: $SKILL_NAME

## Purpose
Khai báo mục đích của skill...

## Use When
- Khi nào dùng...

## Expected Output
- Đầu ra thế nào...
EOF
  echo "Đã tạo: $SKILL_DIR/SKILL.md"
else
  echo "Giữ nguyên file đã có: $SKILL_DIR/SKILL.md"
fi

echo "Khởi tạo thành công."
