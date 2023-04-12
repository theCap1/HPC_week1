        .text
        .type g_peak_asimd_fmul_sp, %function
        .global g_peak_asimd_fmul_sp
        /*
         * Microbenchmark measuring achievable performance using fmla instructions.
         * Repeats 30 independent SP ASIMD-FMAs.
         * @param x0 number of repetitions.
         * @return number of flops per iteration.
         */ 
g_peak_asimd_fmul_sp:
        // PCS: save required data in SIMD registers to stack
        stp  d8,  d9, [sp, #-16]!
        stp d10, d11, [sp, #-16]!
        stp d12, d13, [sp, #-16]!
        stp d14, d15, [sp, #-16]!

        // set SIMD registers to zero
        eor v0.16b, v0.16b, v0.16b
        eor v1.16b, v1.16b, v1.16b
        eor v2.16b, v2.16b, v2.16b
        eor v3.16b, v3.16b, v3.16b

        eor v4.16b, v4.16b, v4.16b
        eor v5.16b, v5.16b, v5.16b
        eor v6.16b, v6.16b, v6.16b
        eor v7.16b, v7.16b, v7.16b

        eor v8.16b, v8.16b, v8.16b
        eor v9.16b, v9.16b, v9.16b
        eor v10.16b, v10.16b, v10.16b
        eor v11.16b, v11.16b, v11.16b

        eor v12.16b, v12.16b, v12.16b
        eor v13.16b, v13.16b, v13.16b
        eor v14.16b, v14.16b, v14.16b
        eor v15.16b, v15.16b, v15.16b

        eor v16.16b, v16.16b, v16.16b
        eor v17.16b, v17.16b, v17.16b
        eor v18.16b, v18.16b, v18.16b
        eor v19.16b, v19.16b, v19.16b

        eor v20.16b, v20.16b, v20.16b
        eor v21.16b, v21.16b, v21.16b
        eor v22.16b, v22.16b, v22.16b
        eor v23.16b, v23.16b, v23.16b

        eor v24.16b, v24.16b, v24.16b
        eor v25.16b, v25.16b, v25.16b
        eor v26.16b, v26.16b, v26.16b
        eor v27.16b, v27.16b, v27.16b

        eor v28.16b, v28.16b, v28.16b
        eor v29.16b, v29.16b, v29.16b
        eor v30.16b, v30.16b, v30.16b
        eor v31.16b, v31.16b, v31.16b

        // perform the operations
loop_repeat:
        sub x0, x0, #1
        fmul s0, s30, s31
        fmul s1, s30, s31
        fmul s2, s30, s31
        fmul s3, s30, s31

        fmul s4, s30, s31
        fmul s5, s30, s31
        fmul s6, s30, s31
        fmul s7, s30, s31

        fmul s8, s30, s31
        fmul s9, s30, s31
        fmul s10, s30, s31
        fmul s11, s30, s31

        fmul s12, s30, s31
        fmul s13, s30, s31
        fmul s14, s30, s31
        fmul s15, s30, s31

        fmul s16, s30, s31
        fmul s17, s30, s31
        fmul s18, s30, s31
        fmul s19, s30, s31

        fmul s20, s30, s31
        fmul s21, s30, s31
        fmul s22, s30, s31
        fmul s23, s30, s31

        fmul s24, s30, s31
        fmul s25, s30, s31
        fmul s26, s30, s31
        fmul s27, s30, s31

        fmul s28, s30, s31
        fmul s29, s30, s31
        cbnz x0, loop_repeat

        // PCS: restore SIMD registers
        ldp d14, d15, [sp], #16
        ldp d12, d13, [sp], #16
        ldp d10, d11, [sp], #16
        ldp  d8,  d9, [sp], #16


        // write number of flops to return register
        mov x0, 30*4

        ret
        .size g_peak_asimd_fmul_sp, (. - g_peak_asimd_fmul_sp)
        