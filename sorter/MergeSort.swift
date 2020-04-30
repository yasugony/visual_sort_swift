//マージソート
//配列を 前半A 後半Bに分割
//配列Aを作業用Cにコピーして BとCを元にAの領域に小さい値を比較しながらコピー,残りの部分は最後にコピー
//これを再帰的に実行する
open class MergeSort : BaseSorter {
    public override func executeSort() {
        mergeCore((0, dataArray.count-1))
    }

    private func getFirstLastIndex(_ firstIndex: Int,_ count:Int) -> Int {
        if count == 1 {
            return firstIndex
        }
       return  firstIndex + (count - count/2 - 1)
    }

    //ポインタが使えないのでタプルで分割を表現
    private func mergeCore(_ term:(first:Int,last:Int)) {
        if term.first == term.last {
            // print("return ")
            return 
        }
        let count = term.last - term.first + 1 //対象範囲の個数を計算
        let firstTermLastIndex = getFirstLastIndex(term.first, count )
        //前半部分を呼び出し
        let firstTerm = (first:term.first, last:firstTermLastIndex)
        // print("前半term:", firstTerm)
        mergeCore(firstTerm)

        //後半部分を呼び出し
        let lastTerm = (first:firstTermLastIndex + 1 , last:term.last)
        // print("後半term:", lastTerm)
        mergeCore(lastTerm)

        //前半部分をコピー
        var workArray :[Int] = []
        for ii in firstTerm.first ... firstTerm.last {
            workArray.append(dataArray[ii])
        }
        var workIndex = 0
        var topIndex = firstTerm.first
        var bottomIndex = lastTerm.first

        //作業配列と後半をマージして前半にコピー
        while workIndex < workArray.count && bottomIndex <= lastTerm.last {
            if compare(dataArray[bottomIndex],workArray[workIndex]) {
                dataArray[topIndex] = dataArray[bottomIndex]
                setCurrentDiffDataDump(topIndex, bottomIndex, DumpType.I)
                bottomIndex += 1
                topIndex += 1
            } else {
                dataArray[topIndex] = workArray[workIndex]
                setCurrentDiffDataDump(topIndex, workArray[workIndex], DumpType.W)
                workIndex += 1
                topIndex += 1
            }
        }

        //ワーク配列にあまりがある場合はお尻にコピーする
        while workIndex < workArray.count {
            dataArray[topIndex] = workArray[workIndex]
            setCurrentDiffDataDump(topIndex, workArray[workIndex], DumpType.W)
            workIndex += 1
            topIndex += 1
        }
    }
}