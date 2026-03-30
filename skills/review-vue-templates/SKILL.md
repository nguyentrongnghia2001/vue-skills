---
name: review-vue-templates
description: Review Vue template code (v-if, v-for, slots, transitions) cho performance, memory safety, proper reactivity binding. Tránh common pitfalls từ vuejs/core issues.
---

# SKILL: review-vue-templates

## Purpose

Review Vue template code để tối ưu hiệu năng, tránh memory leaks, và đảm bảo reactivity đúng cách.
Tập trung vào 4 vấn đề chính:
1. **v-for & v-if** - Key binding, rendering efficiency
2. **Slots & Props** - Parameter reactivity, scoped slots
3. **Transitions & Suspense** - Animation correctness, hydration
4. **Memory Safety** - Event cleanup, listener leaks

## Use When

- Review `.vue` component templates trước PR
- Component có performance issue hoặc memory leak
- Debug v-for/v-if rendering problems
- Optimize Transition/Suspense usage

## Execution Approach

Kiểm tra theo thứ tự:

1. **v-for Key**: Dùng ID/unique key chứ không phải index? Có reactive tracking không?
2. **v-if Conditions**: Có tạo memory leak (DOM nodes lơ lửng) không? Có gây hydration mismatch không?
3. **Slots Props**: Slot params có reactive không? Có bị stale closure không?
4. **Transitions**: `<Transition appear>` có gây SSR hydration mismatch không? Animation có bị skip không?
5. **Event Listeners**: Event listener có được cleanup trong `onUnmounted` không?

## Expected Output

- Checklist Pass 🟢 / Fail 🔴 cho mỗi điểm
- Nêu cụ thể dòng template có vấn đề
- Suggest code fix hoặc refactor

## Context Optimization

- CHỈ đọc `<template>` section, không cần full file
- Nếu cần check logic, dùng `grep_search` để tìm `<script setup>`
