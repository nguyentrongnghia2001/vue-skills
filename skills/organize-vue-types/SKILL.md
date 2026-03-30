---
name: organize-vue-types
description: Organize TypeScript type exports, .d.ts files cho Vue core packages. Kiểm tra exports tree, không gây breaking changes, type inference chuẩn.
---

# SKILL: organize-vue-types

## Purpose

Tổ chức TypeScript types cho Vue core packages (@vue/compiler-core, @vue/runtime-core, @vue/reactivity, v.v.):
1. **Main types** - Những types dùng công khai từ packages
2. **Internal types** - Types nhưng chỉ dùng nội bộ package
3. **Export statement** - Đảm bảo export chính xác, không breaking

## Use When

- Refactor type exports khi thêm feature mới
- Kiểm tra .d.ts file quality trước release
- Giảm type leak/pollution (internal types bị expose)
- Tối ưu bundle size của .d.ts

## Execution Approach

1. **Scan exported types**: Xác định public API types, nên export gì
2. **Find redundant**: Discover types được define nhiều lần hoặc không dùng
3. **Type inference**: Kiểm tra generic inference có mạnh mẽ không
4. **Breaking check**: Xác định thay đổi có breaking backward compat không

## Expected Output

- List public types nên export
- Identify redundant/unused types
- Suggest refactoring nếu cần

## Context Optimization

- CHỈ scan .d.ts files và type definitions
- Không cần đọc implementation files
