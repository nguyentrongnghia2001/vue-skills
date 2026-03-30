---
name: scaffold-nuxt-component
description: Tạo bộ khung Component Nuxt 3 chuẩn Fastboy Payment (Composition API + TS + Scoped CSS).
---
# SKILL: scaffold-nuxt-component

## Purpose
Tiết kiệm thời gian tự tạo file tay. Quy chuẩn mọi Component mới mở ra đều đầy đủ script setup, props, emit, markup theo chuẩn Vue 3. 

## Context Window Optimization
- Tuyệt đối không đọc bất cứ file não ngoài việc lấy tên File Target để sinh nội dung. Nếu user chưa nạp chuẩn CSS, dùng class tailwind hoặc css nguyên bản. Tiết kiệm 95% Context so với việc "AI tự do tìm hiểu hệ thống UI".

## Expected Structure (Luôn sinh ra cấu trúc này thẳng vào file đích)
```html
<script setup lang="ts">
import { ref, computed } from 'vue'

interface Props {
  // Khai báo kiểu ở đây
}

const props = withDefaults(defineProps<Props>(), {
  // Mặc định ở đây
})

const emit = defineEmits<{
  (e: 'update', value: string): void
}>()

// State nội bộ
const isLoading = ref(false)

</script>

<template>
  <div class="component-wrapper">
     <!-- Nội dung UI -->
  </div>
</template>

<style scoped>
.component-wrapper {
  /* Style cục bộ */
}
</style>
```

## Execution
Chỉ cần User cung cấp tên component và đường dẫn (VD: `components/Form/LoginModal.vue`), Agent sẽ gọi trực tiếp Tool tạo file `write_to_file` với cấu trúc trên mà không hỏi nhiều hay đọc file lan man.
