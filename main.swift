import sorter

var sorter = SortExecuor()

//単純選択ソート
print("単純選択ソート")
sorter.exec(StraightSelectionSort())
//ヒープソート
print("ヒープソート")
sorter.exec(HeapSort())

//バブルソート
print("バブルソート")
sorter.exec(BubbleSort())

//コームソート
print("コームソート")
sorter.exec(CombSort())

//マージソート
print("マージソート")
sorter.exec(MergeSort())

//クイックソート
print("クイックソート")
sorter.exec(QuickSort())

//シェイカーソート
print("シェイカーソート")
sorter.exec(ShakerSort())

//単純挿入ソート
print("単純挿入ソート")
sorter.exec(StraightInsertionSort())

//シェルソート
print("シェルソート")
sorter.exec(ShellSort())