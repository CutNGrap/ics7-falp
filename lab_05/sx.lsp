;1 Напишите функцию, которая уменьшает на 10 все числа из списка-аргумента этой 
; функции, проходя по верхнему уровню списковых ячеек. ( * Список смешанный 
; структурированный)

(defun f1 (lst) 
  (
    mapcar #'(lambda (elem)
        (cond ((numberp elem) (- elem 10))
            (T elem))
        ) lst
  )
)


(defun m (lst) 
  (
    mapcan #'(lambda (el)
        (cons
            (cond ((numberp el) (- el 10))
                (T el))
            Nil)
        )
        lst
  )
)
;2 Написать функцию которая получает как аргумент список чисел, а возвращает список 
; квадратов этих чисел в том же порядке.

(defun f2 (lst)
  (
    mapcar #'(lambda (elem)
        (* elem elem)
        ) lst
  )
)

;3 Напишите функцию, которая умножает на заданное число-аргумент все числа из 
; заданного списка-аргумента
; a) все элементы списка --- числа,
; б) элементы списка -- любые объекты.

(defun f3a (num lst)
  (
    mapcar #'(lambda (elem)
      (* num elem)
    ) lst
  )
)

(defun f3b (num lst)
  (
    mapcar #'(lambda (elem)
      (cond
        ((numberp elem) (* num elem))
        (t elem)
      )
    ) lst
  )
)

; 4 Написать функцию, которая по своему списку-аргументу lst определяет является ли он
; палиндромом (то есть равны ли lst и (reverse lst)), для одноуровнего смешанного 
; списка.

(defun f4 (lst)
  (if 
    (
      find-if #'evenp
          (mapcar #'(lambda (elem reverse-elem)
              (cond ((eql elem reverse-elem) 1)
                  (T 0))
            ) lst (reverse lst)
          ) 
    )
    Nil
    T
  )
)

; 5 Используя функционалы, написать предикат set-equal, который возвращает t, если два 
; его множества-аргумента (одноуровневые списки) содержат одни и те же элементы, 
; порядок которых не имеет значения.

(defun set-equal (set1 set2) 
  (
    and (eq (length set1) (length set2))
        (every #'(lambda (elem)
            (member elem set2 :test #'equal)
        ) set1)
        (every #'(lambda (elem)
            (member elem set1 :test #'equal)
        ) set2)
  ) 
)

; 6 Напишите функцию, select-between, которая из списка-аргумента, содержащего только
; числа, выбирает только те, которые расположены между двумя указанными числами - 
; границами-аргументами и возвращает их в виде списка (упорядоченного по 
; возрастанию (+ 2 балла)).

(defun select-between (lst num1 num2)
  (
    mapcan #'(lambda (elem)
      (if (or (< num1 elem num2) (> num1 elem num2)) 
          (list elem)
          ()
      )
    ) lst
  )
)

; 7. Написать функцию, вычисляющую декартово произведение двух своих списков аргументов. ( Напомним, что А х В это множество всевозможных пар (a b), где а 
; принадлежит А, принадлежит В.)

(defun f7 (lst1 lst2)
  (
    mapcan #'(lambda (elem1)
      (mapcar #'(lambda (elem2)
        (list elem1 elem2)
      ) lst2)
    ) lst1
  )
)

; 8. Почему так реализовано reduce, в чем причина?
(reduce #'+ ()) -> 0 
(reduce #'* ()) -> 1

; 9. Пусть list-of-list список, состоящий из списков. Написать функцию, которая 
; вычисляет сумму длин всех элементов list-of-list (количество атомов),
; например 
; для аргумента
;  ((1 2) (3 4)) -> 4

(defun f9 (lst)
  (
    reduce #'+ 
      (
        mapcar #'(lambda (elem)
          (if (atom elem) 1 (f9 elem))
        )lst 
      )
  )
)