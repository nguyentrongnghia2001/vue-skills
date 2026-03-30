---
name: optimize-vue-reactivity
description: Review Vue app reactivity usage (ref, reactive, computed, watch) để tránh memory leaks, redundant tracking, performance regressions. Tham khảo vuejs/core issues.
---

# SKILL: optimize-vue-reactivity

## Purpose

Optimize Vue app reactivity logic để tránh common pitfalls:
1. **Watch Cleanup** - Listener không được remove, setInterval/setTimeout leak
2. **Deep Reactivity** - Reactive large objects, performance regression
3. **Computed Overhead** - Computed được calc lại không cần, dependency tracking sai
4. **Array Mutations** - Các array operation (push, slice, filter, reverse) có track được không?

## Use When

- Component memory leak, continuous memory growth
- Watch/effect không cleanup khi component unmount
- Performance regression khi dùng reactive/watch
- Array/Object mutations không trigger update

## Execution Approach

Kiểm tra theo thứ tự:

1. **Watch Cleanup**: `watch()` có return `() => cleanup` không? `onUnmounted` có gọi `stop()`?
2. **setInterval/setTimeout**: Các timer có được clear không? Có memory leak?
3. **Reactive Objects**: Có dùng `reactive()` cho large objects (performance issue) không? Should use `ref()`?
4. **Array Mutations**: Array mutations (push, shift, fill, reverse) có reactive không? Dùng `.value` chưa?
5. **Deep Watch**: `watch(..., { deep: true })` có overuse không? Có performance impact?

## Expected Output

- Checklist Pass 🟢 / Fail 🔴 cho mỗi pattern
- Root cause của memory leak (nếu có)
- Refactor suggestion

## Context Optimization

- Focus vào `<script setup>`, tránh đọc template
- Grep search cho `watch`, `onMounted`, `onUnmounted` keywords
