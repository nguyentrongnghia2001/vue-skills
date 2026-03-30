---
name: scaffold-pinia-store
description: Tạo bộ khung Pinia theo chuẩn "Setup Store" (Composition API) tốt nhất cho Nuxt 3, chống sinh ra code Vuex cũ.
---
# SKILL: scaffold-pinia-store

## Purpose
Ngăn chặn hoàn toàn việc Model "ảo giác" sinh ra code của Vuex hoặc Pinia đời cũ (Options API Store).
Ngay lập tức sinh ra file Setup Store theo chuẩn Composition API xịn nhất của Vue 3, có sẵn State (ref), Getter (computed) và Action (async function).

## Context Optimization Rules
- KHÔNG gọi `list_dir`, KHÔNG tìm kiếm gì cả. 
- CHỈ NẠP TÊN STORE và XUẤT THẲNG FILE RA MÀ KHÔNG ĐỌC CÁC FILE KHÁC CHỐNG LÃNG PHÍ TOKEN.

## Expected Structure (Luôn xuất ra nguyên mẫu này)
Tuyệt đối phải dùng `defineStore('tên-id', () => { ... })` thay vì truyền object cấu hình.

```ts
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useNameStore = defineStore('name-store', () => {
  // 1. State (tương đương với state trong options api)
  const items = ref<any[]>([])
  const isLoading = ref(false)

  // 2. Getters (tương đương với getters)
  const totalItems = computed(() => items.value.length)
  const hasItems = computed(() => items.value.length > 0)

  // 3. Actions (tương đương với actions)
  const fetchData = async () => {
    if (isLoading.value) return
    isLoading.value = true
    try {
      // Ví dụ: const res = await useMy$Fetch('/api/endpoint')
      // items.value = res.data
    } catch (error) {
      console.error('Failed to fetch data:', error)
    } finally {
      isLoading.value = false
    }
  }

  const resetState = () => {
    items.value = []
  }

  // 4. Expose the API
  return {
    items,
    isLoading,
    totalItems,
    hasItems,
    fetchData,
    resetState
  }
})

// Hỗ trợ HMR (Hot Module Replacement) cho Vite/Nuxt 3
if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(useNameStore, import.meta.hot))
}
```

## Execution
Chỉ cần nhận được lệnh: *"Sinh Pinia Store quản lý [Tên Nghiệp Vụ]"*. Điền logic Tên và Types vào khung mẫu trên, không giải thích dài dòng. Sử dụng Tool để gạch đầu dòng báo cáo ngay.
