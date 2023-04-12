        .text
        .type h_peak_asimd_fmul_dp, %function
        .global h_peak_asimd_fmul_dp
        /*
         * Microbenchmark measuring achievable performance using fmla instructions.
         * Repeats 30 independent SP ASIMD-FMAs.
         * @param x0 number of repetitions.
         * @return number of flops per iteration.
         */ 
h_peak_asimd_fmul_dp:
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
        fmul d0, d30, d31
        fmul d1, d30, d31
        fmul d2, d30, d31
        fmul d3, d30, d31

        fmul d4, d30, d31
        fmul d5, d30, d31
        fmul d6, d30, d31
        fmul d7, d30, d31

        fmul d8, d30, d31
        fmul d9, d30, d31
        fmul d10, d30, d31
        fmul d11, d30, d31

        fmul d12, d30, d31
        fmul d13, d30, d31
        fmul d14, d30, d31
        fmul d15, d30, d31

        fmul d16, d30, d31
        fmul d17, d30, d31
        fmul d18, d30, d31
        fmul d19, d30, d31

        fmul d20, d30, d31
        fmul d21, d30, d31
        fmul d22, d30, d31
        fmul d23, d30, d31

        fmul d24, d30, d31
        fmul d25, d30, d31
        fmul d26, d30, d31
        fmul d27, d30, d31

        fmul d28, d30, d31
        fmul d29, d30, d31
        cbnz x0, loop_repeat

        // PCS: restore SIMD registers
        ldp d14, d15, [sp], #16
        ldp d12, d13, [sp], #16
        ldp d10, d11, [sp], #16
        ldp  d8,  d9, [sp], #16


        // write number of flops to return register
        mov x0, 30*2

        ret
        .size h_peak_asimd_fmul_dp, (. - h_peak_asimd_fmul_dp)
        