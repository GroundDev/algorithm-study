import Foundation


//: # 선택정렬(Selection Sort)

/*:
# 가보자고
*/

//: ---

// 우선 배열을 선언해야겠지.
// 스위프트의 배열(Array)는 C 언어의 배열처럼 버퍼다. 단, C언어처럼 한번 선언하면 크기가 고정되던 버퍼가 아니라, 필요에 따라 자동으로 버퍼의 크기를 조절해주므로 요소의 삽입 및 삭제가 자유롭다. 스위프트는 이런 리스트 타입을 Array, 즉 배열로 표현한다.


var A: Array<Int> = [3, 5, 7, 10, 1, 2] // A.count == 6
var B: Array<Int> = [84, 64, 37, 92, 2, 98, 5, 35, 70, 52, 73, 51, 88, 47]
var C: Array<Int> = [1, 2, 3, 4, 5, 6]

func compare(_ first: Int, _ second: Int) -> Int {
    if first > second {
        return 1
    }
    else if first == second {
        return 0
    }
    else {
        return -1
    }
}

/*
SelectionSort(A)
    input : A, 정렬할 아이템의 배열
    output : A, 정렬된 배열

for i <- 0 to |A| - 1 do
        m <- i
        for j <- j + 1 to |A| do
            if Compare(A[j], A[m]) <- then
                m <- j
        Swap(A[i], A[m])
*/
print("Initial status of A is \(A)")

// i 는 0, 1, 2, 3, 4
for i in 0..<A.count-1 {
    var min: Int = i
    // 만일 i가 0일때, j는 1, 2, 3, 4, 5
    for j in i+1..<A.count {
        if compare(A[j], A[min]) < 0 {
            min = j
        }
    }
    print(A)
    A.swapAt(i, min)
}

print("final result is A = \(A)")

/*
SelectionSortCheckExchanges(A)
    input: A, 정렬될 아이템의 배열
    input: A, 정렬된 배열
 for i <- 0 to |A| - 1 do
    m <- i
    for j <- i+1 to |A| do
        if Compare(A[j], A[m]) < 0 then
            m <- j
    if i != m then
        Swap(A[i], A[m])
*/

A = [3, 5, 7, 10, 1, 2]
print("Initial status of A is \(A)")

for i in 0..<A.count-1 {
    var min: Int = i
    for j in i+1..<A.count {
        if compare(A[j], A[min]) < 0 {
            min = j
        }
    }
    if i != min {
        print(A)
        A.swapAt(i, min)
    }
}

print("final result is A = \(A)")

for i in 0..<C.count-1 {
    var min: Int = i
    // 만일 i가 0일때, j는 1, 2, 3, 4, 5
    for j in i+1..<C.count {
        if compare(C[j], C[min]) < 0 {
            min = j
        }
    }
    //print(C)
    C.swapAt(i, min)
}
for i in 0..<C.count-1 {
    var min: Int = i
    for j in i+1..<C.count {
        if compare(C[j], C[min]) < 0 {
            min = j
        }
    }
    if i != min {
        //print(C)
        C.swapAt(i, min)
    }
}

//: ## 삽입정렬

/*
 InsertionSort(A)
    Input: A, 정렬될 아이템의 배열
    Result: A, 정렬된 배열
 
 for i <- 0 to |A| - 1 do
    j <- i
    while j >0 and Compare(A[j-1], A[j]) > 0 do
        Swap(A[j-1], A[j])
        j<- j-1
*/

var D: Array<Int> = [9, 4, 3, 7, 1, 3, 8]

var j: Int
for i in 0..<D.count-1 {
    j = i
    //(j>0은 배열의 시작 위치를 벗어나지 않기 위해서)index가 작은 쪽에 있는 녀석이 더 큰걸로 판단된다면
    while (j>0 && compare(D[j-1], D[j])>0) {
        D.swapAt(j-1, j)
        j -= 1
    }
}
D

//: ## 싱크 알고리즘
/*
 Sink(A, i, n)
    Input : A, 아이템의 배열
            i, 맞는 위치로 갈 아이템의 인덱스
            n, 고려할 아이템 수
    Result : A, 아이템 A[i]가 맞는 위치로 간 배열
 
 k <- i
 placed <- FALSE
 j <- 2k+1
 while not placed and j<n do
    if j<n-1 and Compare(A[j], A[j+1]) <0 then
        j <- j+1
    if Compare(A[k], A[j]) >= 0 then
        placed <- TRUE
    else
        Swap(A[k], A[j])
    k <- j
    j <- 2k+1
*/

var E: Array<Int> = [84, 64, 37, 92, 2, 98, 5, 35, 70, 52, 73, 51, 88, 47]
var i: Int = 2
var n: Int = E.count

var k: Int = i
var placed: Bool = false
var jj: Int = 2*k+1

while(!placed && jj < n) {
    if (jj<n-1) && compare(E[jj], E[jj+1])<0 {
        jj += 1
    }
    if compare(E[k], E[jj]) >= 0 {
        placed = true
    }
    else {
        E.swapAt(k, jj)
    }
    k = jj
    jj = 2*k+1
}
E

/*
 HeapSort(A)
    Input: A, 아이템의 배열
    Result: A, 정렬된 배열
 n <- |A|
 for i <- int((n-1)/2) to -1 do
    Sink(A, i, n)
 while n>0 do
    Swap(A[0], A[n-1])
    n <- n-1
    Sink(A, 0, n)
*/

