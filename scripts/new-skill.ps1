param(
  [Parameter(Mandatory = $true)]
  [string]$SkillName
)

if ($SkillName -notmatch '^[a-z0-9]+(-[a-z0-9]+)*$') {
  Write-Error "Skill name must be kebab-case, e.g. review-auth-flow"
  exit 1
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$skillDir = Join-Path $repoRoot ".agents/skills/$SkillName"

New-Item -ItemType Directory -Force -Path (Join-Path $skillDir "examples") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $skillDir "templates") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $skillDir "verification") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $skillDir "scripts") | Out-Null

$skillMdPath = Join-Path $skillDir "SKILL.md"
if (-not (Test-Path $skillMdPath)) {
@"
---
name: $SkillName
description: Mô tả ngắn gọn về $SkillName
---
# SKILL: $SkillName

## Purpose
Khai báo mục đích của skill...

## Use When
- Khi nào dùng...

## Expected Output
- Đầu ra thế nào...
"@ | Set-Content -Path $skillMdPath -Encoding UTF8

  Write-Host "Created: $skillMdPath"
}
else {
  Write-Host "Keep existing: $skillMdPath"
}

Write-Host "Scaffold completed: $skillDir"
