#lang scribble/doc
@(require "common.ss")

@title[#:tag "types"]{MysterX Types}

  There are a few special types that appear in the
  types of COM component methods and properties.
  We describe those types and, in some cases, operations
  involving those types.

@defproc[(com-currency? [v any/c]) boolean?]{

  Returns @scheme[#t] if @scheme[v] is a COM currency value,
  @scheme[#f] otherwise.}

@defproc[(com-currency->number [curr com-currency?]) real?]{

  Returns a number for @scheme[curr].}

@defproc[(number->com-currency [n real?]) com-currency?]{

  Converts a number to a COM currency value. A currency value is
  repsented with a 64-bit two's-complement integer, though @scheme[n]
  may contain decimal digits.  If @scheme[n] is too large, an
  exception is raised.}
  
@defproc[(com-date? [v any/c]) boolean?]{

  Returns @scheme[#t] if @scheme[v] is a COM date value, @scheme[#f]
  otherwise.}

@defproc[(com-date->date [d com-date?]) date?]{

  Converts a COM date to an instance of the @scheme[date] structure
  type. In the result, the @scheme[dst?] field is always @scheme[#f],
  and the @scheme[time-zone-offset] field is @scheme[0].}

@defproc[(date->com-date [d date?]) com-date?]{

  Converts a @scheme[date] instance to a COM date value.}
  
@defproc[(com-scode? [v any/c]) boolean?]{

  Returns @scheme[#t] if @scheme[v] is a COM scode value, @scheme[#f]
  otherwise.}

@defproc[(com-scode->number [sc com-scode?]) integer?]{

  Converts a COM scode value to an integer.}

@defproc[(number->com-scode [n integer?]) com-scode?]{

  Converts a number to a COM scode value.  The number must be
  representable as a 32-bit two's-complement number, otherwise an
  exception is raised.}

@defproc[(com-iunknown? [v any/c]) boolean?])

  Returns @scheme[#t] if @scheme[v] is a COM IUnknown value,
  @scheme[#f] otherwise.}
  
@defproc[(mx-any? [v any/c]) boolean?]{

 Returns @scheme[#t] if @scheme[v] is a character, real number,
 string, boolean, COM currency (as in @scheme[com-currency?]), COM
 date (as in @scheme[com-date?]), COM scode value (as in
 @scheme[com-scode?]), COM IUnknown value (as in
 @scheme[com-iunknown?], or COM object (as in @scheme[com-object?]).}
