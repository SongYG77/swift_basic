import UIKit

var isDarkMode : Bool = true

if(isDarkMode == true) {

    print("다크모드 입니다.")
} else {
    print("다크모드가 아닙니다.")
}


if isDarkMode {

    print("다크모드 입니다.")
}
if !isDarkMode {

    print("다크모드가 아닙니다.")
}

var title : String = isDarkMode == true ? "다크모드입니다" : "다크모드가 아닙니다."

print(title)


// 배열을 콜렉션 타입에 저장된다.
//콜렉터 : 데이터를 모아둔 것
// 배열 셋 딕셔너리 등등
// 반복문 for each

var myArray : [Int] = [0,1,2,3,4,5,6,7,8,9,10]//배열

//for item in myArray where item > 5{
//    print("item: \(item)")
//}
for item in myArray where item % 2 ==  0{
    print("item: \(item)")
}
//where의 경우 반복문에 조건을 담을 수 있다.


//enum을 표현하는 방법
//학교 - 초 중 고
enum School {
//    case elementary
//    case middle
//    case high
//
    case elementary, middle, high //둘다 가능
}

let yourSchool = School.high

print("yourschool : \(yourSchool)")// high값을 가짐
print("yourschool : ",yourSchool)

enum Grade : Int {
    case first = 1
    case second = 2
}

let yourGrade = Grade.second
print("yourGrade :", yourGrade.rawValue)
print("yourGrade :", yourGrade)

enum SchoolDetail {
    case elementary(name: String)
    case middle(name: String)
    case high(name: String)
    
    func getname() -> String//함수를 호출하면 문자열을 반환한다.
    {
        switch self // 내가 가지고 있는 case의 값을 가져야 한다.
        {
        //switch case문인데 만약 나 자신이 초 중 고 중 어떤것인지.
        case .elementary(let name) :
            return name
        case let .middle(name) :
            return name
        case .high( let name):
            return name
        }
    }
    // enum 안에 함수를 만들어 호출할 수 있다.
    // switch
}

let yourmiddle = SchoolDetail.middle(name: "천호중학교")

//위 처럼 안에 세부 정보로 값을 담을 수 있다.

print("yourmiddleschool name : ", yourmiddle.getname())

//반복분

//0..<5 는 0,1,2,3,4
for i in 0...5//0 1 2 3 4 5 를 의미(range)
{
    print("호호 : \(i)")
}


var randomInt : [Int] = []
//빈 배열

for _ in 0..<25 //반복 변수를 사용하지 않을 경우
{
    let randomNumber = Int.random(in: 0...100)
    randomInt.append(randomNumber)
    
}
print(randomInt)

//중요한 변수
//옵셔널 변수와 언레핑

//옵셔널이란? 값이 있을수도 있고 없을수도 있을때.
//즉 값이 있는지 없는지 모른다.

var someVariable : Int? = nil

if someVariable == nil {
    someVariable = 90
}

print(someVariable)
//? 를 붙여줘서 옵셔널 변수
//nil은 값이 있지 않다를 뜻.
// 출력하면 Optional(90) 으로 표기가 된다

//언래핑이란? 랩 즉 감싸져있는 것을 벗기는 것.

//벙법에는 여러가지.

if let otherVariable = someVariable// 이 의미는 옵셔널변수인 someVariable에 값이 있다면 그 값을 otherVariable에 넣겟다.
{
    print("언래핑 되었다 즉 값이 있다. : \(otherVariable)")
} else {
    print("값이 없다")
}

//otherVariable의 경우는 옵셔널이 아니다.

someVariable = nil
//someVariable에 겂이 없으면 기본값으로 넣을 수 있다.

let myvalue = someVariable ?? 10
print(myvalue)

//위 처럼 옵셔널 변수 뒤에 ?? 쓰고 값을 씀.

var firstValue : Int? = 30
var secondValue : Int? = nil

print(firstValue, secondValue)
unwrap(parameter : firstValue)
unwrap(parameter : secondValue)

func unwrap(parameter : Int?){
    print("unwrap() called")
    //값이 없으면 리턴 해버린다.
    
    guard let unWrappedParam = parameter//값이 있으면 넣고 없으면 else로 넘어간다.
    else {
        return
    }
    print("unWrappedParam: \(unWrappedParam)")
}


//클래스와 스트럭트
//둘다 모델의 개념.
//변수와 상수의 차이는 값이 변하고 안변하고 (이건 기본)

//먼저 구조체
struct youtuberstruct{
    var name : String
    var subs : Int
}


var devJung = youtuberstruct(name : "웁", subs : 9999999)

var devJungclone = devJung
print(devJungclone.name)

devJungclone.name = "하세"

print(devJungclone.name)
print(devJung.name)
//clone은 복사한 거라 원래 devJung에 영향을 안줌

//클래스

class youtuberclass{
    var name : String
    var subs : Int
    //생성자 - 즉 메모리에 올린다.
    //init으로 매개변수를 가진 생성자 메소드를 만들어야
    //매개변수를 넣어서 그값을 가진 객체를 만들 수 있다.
    init(name : String, subs : Int){
        self.name = name
        self.subs = subs
    }
}

var jungclass = youtuberclass(name : "jung", subs : 100000)

var jungclone = jungclass

print(jungclone.name)
print(jungclass.name)

jungclone.name = "Deri"
print("값 넣은 후")
print(jungclone.name)
print(jungclass.name)

//클래스의 경우 원래 jungclass 역시 바꾸게 된다.
// 그 이유는 구조체는 복사하여 새로운 모델로 만들고 class는 주소를 공유하는 것(참조)
//연결이 되어 있다


//프로퍼티 옵저버

var myAge = 0 {
    willSet{
        print("값이 설정될 예정 \(myAge)")
    }
    didSet{
        print("값이 설정되었다. \(myAge)")
    }
}


myAge = 10
myAge = 20


//함수 ,매개변수

func myfunc(name : String) -> String{
    return "안녕하세요 \(name)"
}

print(myfunc(name: "이름"))

func myfunc2(abc name : String) -> String{
    return "안녕하세요 \(name)"
}
print(myfunc2(abc: "매개변수 바꾸기"))

func myfunc3(_ name : String) -> String{
    return "안녕하세요 \(name)"
}
 
print(myfunc3("따로 이름 지정x _"))


//제네릭

struct MyArray<SomeEl>{
    
    //제네릭을 담은 빈 배열
    var elements : [SomeEl] = [SomeEl]()
    init(_ elements : [SomeEl]){
        self.elements = elements
    }
}

struct Friend{
    var name : String
}

var mysome = MyArray([1,2,3,4])

print(mysome)

let fr1 = Friend(name: "name1")

let fr2 = Friend(name: "name2")
let fr3 = Friend(name: "name3")

var mysome2 = MyArray([fr1,fr2,fr3])
print(mysome2)

//제네릭은 어떠한 형태든 받을 수 있다.

//<> 안에 있는 것이 이제 제네릭 변수
//사용하여 안에 elements 는 배열이지만 어떠한 자료형이 저장되는지는 지정이 안되어있다.


//클로저
//스트링을 반환하는 클러저

let mName : String = {
    return "DLFMA"
}()

print(mName)

//클로저 정의
let myRname : (String) -> String = { (name : String) -> String in
    return "개발자 \(name)"
}
// 메소드 이지만 스트링을 받아 스트링 결고를 저장하는데 이때 받는 것을 name으로 받아 저장하고 이를 return 값을 저장한다
// 결과가 String 형태인데  in을 사용하여 return 하는 값을 받게 되는것.

print(myRname("이름"))

let  mrnlogic : (String) -> Void = { (name: String) in
    print("개발자는 \(name)")
}

mrnlogic("이름")
// 특정 값을 가지지 않고 오직 로직만으로 사용도 가능하다 Void
//위 개념은 익명 함수와 비슷하다고 생각하면 될듯


