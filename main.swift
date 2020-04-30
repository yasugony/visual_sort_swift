import sorter

var sorter = SortExecuor()

//単純選択ソート
print("単純選択ソート")
sorter.exec(StraightSelectionSort())

//バブルソート
print("バブルソート")
sorter.exec(BubbleSort())

//コームソート
print("コームソート")
sorter.exec(CombSort())

//単純挿入ソート
print("単純挿入ソート")
sorter.exec(StraightInsertionSort())

//シェルソート
print("シェルソート")
sorter.exec(ShellSort())

//ヒープソート
print("ヒープソート")
sorter.exec(HeapSort())

//マージソート
print("マージソート")
sorter.exec(MergeSort())

//シェイカーソート
print("シェイカーソート")
sorter.exec(ShakerSort())

//クイックソート
print("クイックソート")
sorter.exec(QuickSort())

