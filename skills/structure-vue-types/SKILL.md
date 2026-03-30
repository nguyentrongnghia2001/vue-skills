---
name: structure-vue-types
description: Structure Vue components TypeScript types (props, emits, slots) để tránh type inference slowness, generic complexity. Dựa trên vuejs/core #14323.
---

# SKILL: structure-vue-types

## Purpose

Optimize Vue component TypeScript types:
1. **Props Types** - Generic inference không slow down compiler (issue #14323)
2. **Emits Types** - defineEmits type safety
3. **Slots Types** - Scoped slot type inference
4. **Generic Complexity** - Tránh deeply nested generics

## Use When

- Component `.ts` file có TypeScript slow/lag
- defineModel + defineEmits cùng file gây TS compiler slow
- Props interface too complex, vỡ IDE autocomplete
- Props/Emits reuse ở nhiều components

## Execution Approach

Kiểm tra theo thứ tự:

1. **Props Type**: Có dùng generic union quá phức tạp không? Có thể simplify bằng `as const` không?
2. **defineModel/defineEmits**: Cùng file copy props type 2 lần? Có thể extract ra `.d.ts` không?
3. **Slot Types**: Slot scope generics có clean không? Có tránh `any` chưa?
4. **Reuse**: Props interface được define ở 3, 4 component? Nên move ra `types/` shared

## Expected Output

- Identify over-complex types gây TS lag
- Suggest `.d.ts` extraction nếu cần
- Refactor to remove duplication

## Context Optimization

- Focus vào `<script setup lang="ts">` section
- Grep search cho `defineProps`, `defineEmits`, `defineModel`
