use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# A culinary school's pastry program says which courses each course needs first. The plan for a course gives its title, its credits, and up to two courses it needs, each with a plan of its own. A student's transcript lists the courses they have taken, with their grades. A course is passed with a grade of 70 or more, and a student may take a course more than once.
# You may assume that if a student passed a course, they also passed every course it needs.

# Copy these definitions and examples into your file:

data Transcript:
  | no-courses
  | took(title :: String, grade :: Number, rest :: Transcript)
end

data Plan:
  | nothing-needed
  | course(title :: String, credits :: Number, needs-a :: Plan, needs-b :: Plan)
end

wedding-cakes =
  course("Wedding Cakes", 4,
    course("Layer Cakes", 3,
      course("Baking Basics", 2, nothing-needed, nothing-needed),
      course("Frosting", 2, nothing-needed, nothing-needed)),
    course("Sugar Work", 3,
      course("Candy Making", 2, nothing-needed, nothing-needed),
      nothing-needed))

so-far = took("Baking Basics", 91, took("Candy Making", 64, took("Frosting", 78, no-courses)))

# wedding-cakes looks like this, with each course's credits:
# Wedding Cakes (4)
# ├── Layer Cakes (3)
# │   ├── Baking Basics (2)
# │   └── Frosting (2)
# └── Sugar Work (3)
#     └── Candy Making (2)

# Start each function from the template for its data, as in class. Later parts should call the functions from earlier parts rather than repeating that logic.

# Part 1: Passed
# Design and implement passed, which takes a transcript and the title of a course and returns whether the transcript shows that course passed.
# Example behavior:

fun passed(t :: Transcript, title1 :: String) -> Boolean:
  doc: "returns whether the course is passed"
  
  cases (Transcript) t:
    | no-courses => false
    | took(title, grade, rest) => 
      ((title == title1) and (grade >= 70)) or passed(rest, title1)
      
  end
where:
  passed(no-courses, "Frosting") is false
  passed(so-far, "Frosting") is true
  passed(so-far, "Candy Making") is false
  passed(took("Candy Making", 64, took("Candy Making", 85, no-courses)), "Candy Making") is true
  passed(so-far, "Sugar Work") is false
end

# Part 2: Credits to go
# Design and implement credits-to-go, which takes a plan and a transcript and returns how many credits of courses in the plan the student still has to pass, counting the plan's own course.

fun credits-to-go(p :: Plan, t :: Transcript) -> Number:
  doc: "returns how many credits are left to pass"
  
  cases (Plan) p:
    | nothing-needed => 0 
    | course(title, credits, needs-a, needs-b) => 
      if passed(t, title):
        0
      else:
        credits + credits-to-go(needs-a, t) + credits-to-go(needs-b, t)
      end
  end
where:
  credits-to-go(nothing-needed, so-far) is 0
  credits-to-go(course("Frosting", 2, nothing-needed, nothing-needed), so-far) is 0
  credits-to-go(wedding-cakes, no-courses) is 16
  credits-to-go(wedding-cakes, so-far) is 12
end


# Part 3: Semesters to go
# A student can take as many courses as they like in one semester, but only courses whose needed courses they have already passed.
# Design and implement semesters-to-go, which takes a plan and a transcript and returns the fewest semesters until the student has passed the plan's course.

fun semesters-to-go(p :: Plan, t :: Transcript) -> Number:
  doc: "returns the fewest semesters unti lthe student has passed the plan's course" 
  
  cases (Plan) p:
    | nothing-needed => 0
    | course(title, credits, needs-a, needs-b) => 
      if passed(t, title):
        0
      else:
        1 + num-max(semesters-to-go(needs-a, t), semesters-to-go(needs-b, t))
      end
  end
where:
  semesters-to-go(nothing-needed, no-courses) is 0
  semesters-to-go(wedding-cakes, took("Wedding Cakes", 88, no-courses)) is 0
  semesters-to-go(wedding-cakes, no-courses) is 3
  semesters-to-go(wedding-cakes, so-far) is 3
  semesters-to-go(wedding-cakes, took("Candy Making", 85, so-far)) is 2
end

# Part 4: Still to take
# Design and implement still-to-take, which takes a plan and a transcript and returns a list of the titles of the courses in the plan that the student still has to pass, in an order they could take them: each course comes after the courses it needs, and needs-a's courses come before needs-b's. You can join two lists with +, as in [list: 1] + [list: 2, 3].
# Example behavior:
# nothing-needed, no-courses → [list: ]
# wedding-cakes, no-courses → [list: "Baking Basics", "Frosting", "Layer Cakes", "Candy Making", "Sugar Work", "Wedding Cakes"]
# wedding-cakes, so-far → [list: "Layer Cakes", "Candy Making", "Sugar Work", "Wedding Cakes"]


# Part 5 (if you have time)
# Design and implement ready-now, which takes a plan and a transcript and returns a list of the courses in the plan the student could sign up for now: the ones not passed yet whose needed courses are all passed, or that need nothing. List needs-a's courses before needs-b's.
# Example behavior:
# wedding-cakes, so-far → [list: "Layer Cakes", "Candy Making"]
# wedding-cakes, no-courses → [list: "Baking Basics", "Frosting", "Candy Making"]
# wedding-cakes, took("Layer Cakes", 80, took("Sugar Work", 75, no-courses)) → [list: "Wedding Cakes"]
# wedding-cakes, took("Wedding Cakes", 95, no-courses) → [list: ]
