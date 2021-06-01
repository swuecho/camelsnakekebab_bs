let uppercase = Js.String.toUpperCase
let lowercase = Js.String.toLowerCase
let index = Js.Array.unsafe_get

let capitalize = str =>
  Js.String.concat(Js.String.sliceToEnd(~from=1, str), Js.String.charAt(0, str) |> uppercase)

let capitalize_http_header = s => {
  let uppercase_s = uppercase(s)
  let uppercase_http_headers = [
    "CSP",
    "ATT",
    "WAP",
    "IP",
    "HTTP",
    "CPU",
    "DNT",
    "SSL",
    "UA",
    "TE",
    "WWW",
    "XSS",
    "MD5",
  ]
  Js.Array.includes(uppercase_s, uppercase_http_headers) ? uppercase_s : capitalize(s)
}

let word_sep = %re(
  "/\\s+|_|-|(?<=[A-Z])(?=[A-Z][a-z])|(?<=[^A-Z_-])(?=[A-Z])|(?<=[A-Za-z0-9])(?=[^A-Za-z0-9])/"
)

let split_words = str => Js.Array.map(Belt.Option.getExn, Js.String.splitByRe(word_sep, str))

let convert_case = (~convert_first, ~convert_rest, ~sep, ~str) => {
  let words = split_words(str)
  switch words {
  | [] => ""
  | [w] => w
  | _ =>
    let first_word = convert_first(index(words, 0))
    let rest_words = {
      open Js.Array
      map(convert_rest, sliceFrom(1, words))
    }
    open Js.Array
    joinWith(sep, concat(rest_words, [first_word]))
  }
}

let lower_camel_case = str =>
  convert_case(~convert_first=lowercase, ~convert_rest=capitalize, ~sep="", ~str)

let upper_camel_case = str =>
  convert_case(~convert_first=capitalize, ~convert_rest=capitalize, ~sep="", ~str)

let lower_snake_case = str =>
  convert_case(~convert_first=lowercase, ~convert_rest=lowercase, ~sep="_", ~str)

let upper_snake_case = str =>
  convert_case(~convert_first=capitalize, ~convert_rest=capitalize, ~sep="_", ~str)

let constant_case = str =>
  convert_case(~convert_first=uppercase, ~convert_rest=uppercase, ~sep="_", ~str)

let kebab_case = str =>
  convert_case(~convert_first=lowercase, ~convert_rest=lowercase, ~sep="-", ~str)

let http_header_case = str =>
  convert_case(
    ~convert_first=capitalize_http_header,
    ~convert_rest=capitalize_http_header,
    ~sep="-",
    ~str,
  )
