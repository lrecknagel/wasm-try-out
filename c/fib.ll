; ModuleID = 'fib.c'
source_filename = "fib.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32"

; Function Attrs: nounwind
define hidden i32 @fib(i32 %n) #0 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %if.end13

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4
  br label %if.end13

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %n.addr, align 4
  %cmp4 = icmp eq i32 %2, 1
  br i1 %cmp4, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.else3
  store i32 1, i32* %retval, align 4
  br label %if.end13

if.else6:                                         ; preds = %if.else3
  %3 = load i32, i32* %n.addr, align 4
  %cmp7 = icmp sgt i32 %3, 1
  br i1 %cmp7, label %if.then8, label %if.end

if.then8:                                         ; preds = %if.else6
  %4 = load i32, i32* %n.addr, align 4
  %sub = sub nsw i32 %4, 1
  %call = call i32 @fib(i32 %sub)
  %5 = load i32, i32* %n.addr, align 4
  %sub9 = sub nsw i32 %5, 2
  %call10 = call i32 @fib(i32 %sub9)
  %add = add nsw i32 %call, %call10
  store i32 %add, i32* %retval, align 4
  br label %if.end13

if.end:                                           ; preds = %if.else6
  br label %if.end11

if.end11:                                         ; preds = %if.end
  br label %if.end12

if.end12:                                         ; preds = %if.end11
  br label %if.end13

if.end13:                                         ; preds = %if.then, %if.then2, %if.then5, %if.then8, %if.end12
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 "}
