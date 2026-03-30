---
name: review-reactivity-patterns
description: Review Reactivity API usage, tracking logic, dependency graphs trong Vue core @vue/reactivity package. Kiểm tra proxy handlers, effect cleanup, memory leaks ở library level.
---

# SKILL: review-reactivity-patterns

## Purpose

Review reactivity code cho Vue core `@vue/reactivity` package, tập trung vào:
1. **Proxy & Traps** - Reactive object traps implementation
2. **Dependency Tracking** - Effect dependencies, tracking correctness  
3. **Cleanup & Memory** - Effect cleanup, memory leak prevention
4. **Circular Dependencies** - Detect và handle vòng lặp phụ thuộc

## Use When

- Review PR ở `reactivity/` package
- Debug reactivity-related issues (nested reactive, deep watch, v.v.)
- Optimize tracking performance
- Audit memory usage trong effect/computed

## Execution Approach

Kiểm tra theo thứ tự:

1. **Proxy Traps**: Có capture hết các operations (get, set, has, delete)?
2. **Tracking State**: `activeEffect` stack có consistent không? Có memory leak không?
3. **Cleanup**: Thẻ `stop()` hay effect cleanup có work chính xác không?
4. **Edge Cases**: Circular deps, Map/Set traps, Array mutations có handle được không?

## Expected Output

- List các issue tìm thấy (nếu có)
- Checklist pattern compliance
- Performance suggestion (nếu có)

## Context Optimization

- Focus vào logic layer, tránh đọc test files ngoài cần thiết
- Dùng `grep_search` để tìm usage patterns nếu cần
