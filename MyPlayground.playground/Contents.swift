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



//매개변수로서 클로저
func sayHi(completion : () -> Void){
    print("SayHi called")
    //sleep(2)
    completion()
}
//completion이라는 클로져를 배개변수로 가지는 함수.

sayHi(completion: {
    print("2초 가 지남")
})

//또는
sayHi() {
    print("2초가 지남.")
}

sayHi {
    print("2초가 지남.")
}// 맨 마지막이 클로저가 있으면 이런 블록처럼 사용도 가능.


//매개변수로써의 클로저가 매개변수를 가짐, 즉 매개변수로써 데이터를 반환하는 클로저

func secsayHi(completion : (String) ->Void){
    
    print("say hi with name called")
    //sleep(2)
    completion("오늘도 빡코딩 중인가여")
}

secsayHi(completion: {(comparam : String ) in
    print("2초뒤에 그가 말했다.", comparam)
})

//또는

secsayHi(completion: { comparam in
    print("2초뒤에 그가 말했다.", comparam)
})

//또는

secsayHi{ comparam in
    print("2초뒤에 그가 말했다.", comparam)
}
//또는

secsayHi{
    print("2초뒤에 그가 말했다.", $0)
}// 파라미터가 여러개일때 $0 $1 $2...

func thirdsayHi(completion : (String, String) ->Void){
    
    print("say hi with name called")
    //sleep(2)
    completion("오늘도 빡코딩 중인가여", "ㅎㅎㅎ")
}//매개변수 2개를 받는 매개변수클로저

thirdsayHi() {firstpa , secondpa in
    print("매개변수 두개 받아요~ \(firstpa) 그리고 \(secondpa)")
}

thirdsayHi() { _, secondpa in
    print("처음 매개변수 생략해여 \(secondpa)")
}// _로 지정하면 생략.


//만약 매개변수 클로저인 completion을 받기 싫을때.
// 클로저 자체를 옵셔널로 만든다.

func OptionalHi(completion : (() -> Void)? = nil){
    print("SayHi")
    //sleep(2)
    completion?()
}

OptionalHi()

OptionalHi(completion: {
    print("completion이 있다.")
})

//위 매개변수 클로저는 map이나 min함수의 기본이기도 하다.

var manumber : [Int] = [0, 1, 2, 3, 4, 5]

var transformnum = manumber.map { anumber in
    return "숫자 : \(anumber)"
}

//객체 생성자, 해제자.
// 메모리에 올리고 해제하는 개념.


class MF {
    let name : String
    
    init(_ name : String = "이름없음") {
        self.name = name
        print("MF가 메모리에 들어감")
    }
    deinit {
        print("메모리에서 사라짐")
    }//메모리 할당이 해제될 때 나오는데 사실 확인하기 힘듬.
}

let mf1 = MF("홍길동")

let mfnone = MF()
print(mf1.name)
print(mfnone.name)

print(Unmanaged.passRetained(mf1).toOpaque())
print(Unmanaged.passRetained(mfnone).toOpaque())


//상속.

class freind11 {
    let name : String
    
    init(_ name : String){
        self.name = name
    }
    
    func SHi() {
        print("안녕 난 \(self.name) 이라고해")
    }
}

class BF : freind11 {
    
    
    override init(_ name: String) {
        
        //부모의 init을 무조건 덮어야해 super을 콜 한다.
        super.init("BF" + name)
    }
    
    override func SHi(){
        super.SHi()
    }
    
}

let myf = freind11("친구")
myf.SHi()

let mybf = BF("베프")
mybf.SHi()

print(mybf.name)

//딕셔너리.

//키와 값으로 이루어짐.
//만약 값이 없으면 디폴트 값이 나오게 할 수 있다

var dicf = ["mybf" : "베프",
            "myf" : "친구"
            ]

let bestfr = dicf["mybf"]
let youtuber = dicf["youtuber" , default : "친구없음"]

dicf["mybf"] = "베프베프"

let transbf = dicf["mybf"]

dicf["newfr"] = "새로운친구"

let newF = dicf["newfr"]

dicf.updateValue("updatefr", forKey: "update")
//원래 있는 값으로도 가능하다(값이 바뀜)
let upfr = dicf["update"]


let diction : [String : Int] = [:]
let diction2 = [String : Int]()
//빈 딕셔너리 생성


print(dicf.count)

for item in dicf{
    print("item :", item)
}


//final class.

final class FC1 {
    var name : String
    
    init(name : String){
        self.name = name
    }
}

//class FC1EX : FC1 {
//
//    override init(name: String) {
//        super .init(name: "상속" + name)
//    }
//}

let tfc1 = FC1(name: "호호")
//let tfcex = FC1EX(name: "하하")

//final의 경우 상속이 안된다 . 위 코드를 주석해제 하면 오류남.


//inout

func IOsay(_ name : String) {
    print("안녕ㅇ 나는 \(name)이라고 해")
}//name을 변경하려고 하면 오류가 난다.
//let과 같다고 생각하면 된다.
//값을 변경하는 방법

func IOsay2(_ name : inout String) {
    name = "사람인 " + name
    print("안녕ㅇ 나는 \(name)이라고 해")
}
//inout을 붙여주면 된다. 다만 이제 이 파라미터에 값을 넣어줄 때 아래처럼해야한다.
IOsay("이름")
var nmnm = "이름"

IOsay2(&nmnm)
//앞에 &를 넣어줘야하는데 이를 할땐 변수를 활용하여 따로 저장하고 넣어줘야 한다.

//에러
enum MismatchError : Error{
    case nameMissmatch
    case numberMissmatch
}

//에러를 정의해둔다.

func guessMyName(name input : String) throws{ //안에서는 input 외부 값 넣을땐 name
    //throws를 붙임으로써 에러 처리를 하겟다.
    print("guessMyname : called")
    
    if input != "이름" {
        print("틀렷다")
        throw MismatchError.nameMissmatch
        //throw를 사용해 위에서 지정한 에러 사용
    }
    
    print("맞췃다.")
    
}


/// 번호를 맞춘다
/// - Parameter input: 사용자 숫자 입력
/// - Throws: 못맞췃을때
/// - Returns: 맞췃는지 여부

//위 커멘드는 option + command + /
func guessMyNumber(number input : Int) throws -> Bool{
    print("숫자 called")
    if input != 10 {
        print("틀렷다.")
        throw MismatchError.numberMissmatch
    }
    print("맞췃다.")
    return true
}

//try? guessMyName(name: "나이")
//throws 즉 에러처리가 있는 메소드를 사용한다면 try를 붙여야한다.
//만약 에러 처리를 사용하지 않을 경우 try? 라고 한다.
//?가 없으면 에러를 잡겟다는 뜻.
do {
    try guessMyName(name: "나이")
} catch {
    print("잡은 에러 : \(error)")
}
//catch를 사용하면 에러가 자동으로 들어가게 된다.

//try! guessMyName(name: "나이")
//!의 경우 에러가 없다고 하는것인데. 만약 에러 발생하면 오류가 난다.

do {
    let receivedValue = try guessMyNumber(number: 9)// 값이 안들어감
} catch {
    print("잡은 에러 : \(error)")
}

//struct mutating

class SMC {
    var name : String
    func changeName(newName : String) {
        self.name = newName
    }
    init(_ name:String) {
        self.name = name
    }
}
var smcnn = SMC("이름")
smcnn.changeName(newName: "새이름")

print(smcnn.name)
//이것은 클래스의 경우.
//클래스에선 이름을 바꿀때 뮤테이팅 없어도 된다.

struct SM {
    var name : String
    
    mutating func changeName(newname : String){
        self.name = newname
    }//스트럭트 내의 맴버변수를 변경하려면 구조체는 mutating을 붙여줘야 한다.
    
}

var smsm = SM(name: "뮤테팅")
smsm.changeName(newname: "뮤테팅 완료p")
print(smsm.name)

//set
// set도 collection의 한 종류 이다.
//배열은 인덱스 딕셔너리는 키 벨류 셋은 고유값.
//set은 인덱스가 고정되어있지 않다.
//그래서 인덱스를 찾아 위치를 불러와야 그 값을 인덱스를 이용하여 활용가능.
var mynumset : Set<Int  > = Set<Int>()

mynumset.insert(1)
mynumset.insert(2)
mynumset.insert(3)
mynumset.insert(4)
mynumset.insert(1)
mynumset.insert(1)

print("개수",mynumset.count)

for i in mynumset {
    print(i)
}

var setb = mynumset.contains(1)
print(setb)

setb = mynumset.contains(5)
print(setb)
//conatins 는 값이 있는지 없는지.

if let indexToRM = mynumset.firstIndex(of: 1){
    print(indexToRM)
    mynumset.remove(at: indexToRM)
    print("1삭제")
    
}
print(mynumset)

//스트럭트도 메소드를 가지고있다. 예시는 스킵.


//프로토콜(약속?)
///보통 프로토콜 명은 --ing 또는 --able정도로 짓는다.
protocol Naming{
    //우리는 이런 변수를 가지고 있을겁니다라고 약속.
    var lastname : String { get set }
    var firstname : String { get set }
    //우리는 이런 메소드를 가지고있을겁니다 라고 약속
    func getName() -> String
}

//struct PF : Naming{
//    var name: String
//
//    func getName() -> String {
//        return "내 친구 : " + self.name
//    }
//
//}꼭 프로토콜로 지정한 것들을 가지고 있어야한다.

//프로토콜 상속.

protocol Aging {
    var age : Int {get set}
}

protocol Usernotifiable : Naming, Aging {
    
}

struct PFEX : Usernotifiable{
    var lastname: String
    
    var firstname: String
    
    func getName() -> String {
        <#code#>
    }
    
    var age: Int
    
    
}
class PFEXclass : Usernotifiable{
    var lastname: String
    
    var firstname: String
    
    
    func getName() -> String {
        <#code#>
    }
    
    var age: Int
    
    init(lastname: String,firstname:String, age : Int) {
        self.lastname = lastname
        self.firstname = firstname
        self.age = age
    }
    
}
//이런식으로 사용이 가능하다.


//프로토콜 확장.
//프로토콜은 원래 메소드 x 사용할거라고 선언만 하지 로직을 넣진 못한다

extension Naming {
    func getfulltname() -> String{
        return self.lastname + " " + self.firstname
    }
}
//extension을 사용하면 로직을 넣은 메소드를 넣을 수 있다.

struct PFM : Naming{
    var lastname: String
    
    var firstname: String
    
    func getName() -> String {
        return self.lastname
    }
    
}
let pfml = PFM(lastname: "홍", firstname: "길동")

pfml.getName()
pfml.getfulltname()
//사용 가능한것을 볼 수 있다.

//프로토콜 associatedType.

protocol PetHaving{
    associatedtype T
    var pets : [T] {get set}
    mutating func gotnewpet(_ newpet : T)
}

extension PetHaving{
    mutating func gotnewpet(_ newpet : T){
        self.pets.append(newpet)
    }
}

enum Animal{
    case cat, dog, bird
}

struct FPET : PetHaving{
    var pets: [Animal] = []
}

struct FamPet : PetHaving{
    var pets : [String] = []
}

var mpf = FPET()

mpf.gotnewpet(Animal.cat)
mpf.gotnewpet(Animal.dog)
mpf.gotnewpet(Animal.bird)


var fam1 = FamPet()
fam1.gotnewpet("거북이")
fam1.gotnewpet("토끼")
fam1.gotnewpet("강아지")

//검색 키워드
//foreach, enum, for, unwrap, class, struct
//옵저버, 제네릭, 클로저, 생성자 해제자, 상속, 딕셔너리
//final, inout, error, mutating, set, protocol
