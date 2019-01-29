(* OCaml *)
open Jest
open Camelsnakekebab

let _ =
  describe "split words" ( fun () ->
      let open Expect in 
      test "split 1" (fun () ->
          expect (split_words "foo bar") |> toEqual [|"foo"; "bar"|])
    );
  describe "split words" ( fun () ->
      let open Expect in 
      test "split 2" (fun () ->
          expect (split_words "foo\n\tbar") |> toEqual [|"foo"; "bar"|])
    );
  describe "split words" ( fun () ->
      let open Expect in 
      test "split 3" (fun () ->
          expect (split_words "foo-bar") |> toEqual [|"foo"; "bar"|])
    );
  describe "split words" ( fun () ->
      let open Expect in 
      test "split 4" (fun () ->
          expect (split_words "fooBar") |> toEqual [|"foo"; "Bar"|])
    );
  describe "split words" ( fun () ->
      let open Expect in 
      test "split 5" (fun () ->
          expect (split_words "FooBar") |> toEqual [|"Foo"; "Bar"|])
    );
  describe "split words" ( fun () ->
      let open Expect in 
      test "upper_snake_case" (fun () ->
          expect (upper_snake_case "ASnakeSlithersSlyly") |> toEqual "A_Snake_Slithers_Slyly")
    )



