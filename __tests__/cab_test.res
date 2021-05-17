/* OCaml */
open Jest
open Camelsnakekebab

let _ = {
  describe("split words", () => {
    open Expect
    test("split 1", () => expect(split_words("foo bar")) |> toEqual(["foo", "bar"]))
  })
  describe("split words", () => {
    open Expect
    test("split 2", () => expect(split_words("foo\n\tbar")) |> toEqual(["foo", "bar"]))
  })
  describe("split words", () => {
    open Expect
    test("split 3", () => expect(split_words("foo-bar")) |> toEqual(["foo", "bar"]))
  })
  describe("split words", () => {
    open Expect
    test("split 4", () => expect(split_words("fooBar")) |> toEqual(["foo", "Bar"]))
  })
  describe("split words", () => {
    open Expect
    test("split 5", () => expect(split_words("FooBar")) |> toEqual(["Foo", "Bar"]))
  })
  describe("split words", () => {
    open Expect
    test("upper_snake_case", () =>
      expect(upper_snake_case("ASnakeSlithersSlyly")) |> toEqual("A_Snake_Slithers_Slyly")
    )
  })
}
