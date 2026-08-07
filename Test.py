import time


x = "01234567890123456789"
start = time.perf_counter()
for i in x:
    print(i)
    
end = time.perf_counter()
elapsed = end - start
print(f"{elapsed:.4f}")