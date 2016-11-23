(module
  (table 0 anyfunc)
  (memory $0 31)
  (data (i32.const 4) "\90\84\1e\00")
  (export "memory" (memory $0))
  (export "_Z3fibi" (func $_Z3fibi))
  (func $_Z3fibi (param $0 i32) (result i32)
    (local $1 i32)
    (i32.store offset=4
      (i32.const 0)
      (tee_local $1
        (i32.sub
          (i32.load offset=4
            (i32.const 0)
          )
          (i32.const 16)
        )
      )
    )
    (i32.store offset=8
      (get_local $1)
      (get_local $0)
    )
    (block $label$0
      (block $label$1
        (block $label$2
          (block $label$3
            (block $label$4
              (br_if $label$4
                (i32.le_s
                  (get_local $0)
                  (i32.const -1)
                )
              )
              (br_if $label$3
                (i32.eqz
                  (i32.load offset=8
                    (get_local $1)
                  )
                )
              )
              (br_if $label$2
                (i32.ne
                  (i32.load offset=8
                    (get_local $1)
                  )
                  (i32.const 1)
                )
              )
              (i32.store offset=12
                (get_local $1)
                (i32.const 1)
              )
              (br $label$1)
            )
            (i32.store offset=12
              (get_local $1)
              (i32.const -1)
            )
            (br $label$1)
          )
          (i32.store offset=12
            (get_local $1)
            (i32.const 0)
          )
          (br $label$1)
        )
        (br_if $label$0
          (i32.lt_s
            (i32.load offset=8
              (get_local $1)
            )
            (i32.const 2)
          )
        )
        (i32.store offset=12
          (get_local $1)
          (i32.add
            (call $_Z3fibi
              (i32.add
                (i32.load offset=8
                  (get_local $1)
                )
                (i32.const -1)
              )
            )
            (call $_Z3fibi
              (i32.add
                (i32.load offset=8
                  (get_local $1)
                )
                (i32.const -2)
              )
            )
          )
        )
      )
      (set_local $0
        (i32.load offset=12
          (get_local $1)
        )
      )
      (i32.store offset=4
        (i32.const 0)
        (i32.add
          (get_local $1)
          (i32.const 16)
        )
      )
      (return
        (get_local $0)
      )
    )
    (unreachable)
    (unreachable)
  )
)
