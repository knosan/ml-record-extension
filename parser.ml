
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | STRING of (
# 10 "parser.mly"
       (string)
# 11 "parser.ml"
  )
    | SS
    | SEMI_COLON
    | RIGHT_PAREN
    | RIGHT_BRACE
    | PROJ
    | LET
    | LEFT_PAREN
    | LEFT_BRACE
    | LABEL of (
# 9 "parser.mly"
       (string)
# 24 "parser.ml"
  )
    | INT of (
# 7 "parser.mly"
       (int)
# 29 "parser.ml"
  )
    | IN
    | FUN
    | FLOAT of (
# 8 "parser.mly"
       (float)
# 36 "parser.ml"
  )
    | EXTEND
    | EQ
    | EOF
    | DEFAULT
    | ARROW
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState54
  | MenhirState52
  | MenhirState42
  | MenhirState34
  | MenhirState30
  | MenhirState27
  | MenhirState24
  | MenhirState23
  | MenhirState21
  | MenhirState18
  | MenhirState13
  | MenhirState10
  | MenhirState9
  | MenhirState6
  | MenhirState4
  | MenhirState3
  | MenhirState0

# 2 "parser.mly"
  
  open HindleyMilner

# 81 "parser.ml"

let rec _menhir_run42 : _menhir_env -> ((('ttv_tail * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 86 "parser.ml"
))) * _menhir_state * 'tv_term -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEFAULT ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | EXTEND ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | FLOAT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | FUN ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | INT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | LABEL _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | LEFT_BRACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | LEFT_PAREN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | PROJ ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_goto_option_SEMI_COLON_ : _menhir_env -> 'ttv_tail -> 'tv_option_SEMI_COLON_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv215 * _menhir_state * 'tv_term) * 'tv_option_SEMI_COLON_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RIGHT_BRACE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv211 * _menhir_state * 'tv_term) * 'tv_option_SEMI_COLON_) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv209 * _menhir_state * 'tv_term) * 'tv_option_SEMI_COLON_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (t : 'tv_term)), (_2 : 'tv_option_SEMI_COLON_)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_fields = 
# 66 "parser.mly"
                                                   ( t )
# 138 "parser.ml"
         in
        _menhir_goto_fields _menhir_env _menhir_stack _menhir_s _v) : 'freshtv210)) : 'freshtv212)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv213 * _menhir_state * 'tv_term) * 'tv_option_SEMI_COLON_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)) : 'freshtv216)

and _menhir_run47 : _menhir_env -> ('ttv_tail * _menhir_state) * _menhir_state * 'tv_aterm -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv207 * _menhir_state) * _menhir_state * 'tv_aterm) = Obj.magic _menhir_stack in
    ((let ((_menhir_stack, _menhir_s), _, (t : 'tv_aterm)) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : 'tv_sterm = 
# 50 "parser.mly"
                                                   ( t )
# 160 "parser.ml"
     in
    _menhir_goto_sterm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv208)

and _menhir_goto_term : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_term -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv159 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 173 "parser.ml"
        ))) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv157 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 179 "parser.ml"
        ))) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), (v : (
# 9 "parser.mly"
       (string)
# 184 "parser.ml"
        ))), _, (t : 'tv_term)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_aterm = 
# 45 "parser.mly"
                                                  ( Abs (v, t) )
# 191 "parser.ml"
         in
        _menhir_goto_aterm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv158)) : 'freshtv160)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state * (
# 9 "parser.mly"
       (string)
# 199 "parser.ml"
        ))) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMI_COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv161 * _menhir_state * (
# 9 "parser.mly"
       (string)
# 209 "parser.ml"
            ))) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DEFAULT ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | EXTEND ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | FLOAT _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | FUN ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | INT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | LABEL _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | LEFT_BRACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | LEFT_PAREN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | PROJ ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | RIGHT_BRACE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | STRING _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv162)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv163 * _menhir_state * (
# 9 "parser.mly"
       (string)
# 249 "parser.ml"
            ))) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)) : 'freshtv166)
    | MenhirState10 | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv175 * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEMI_COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv169) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv167) = Obj.magic _menhir_stack in
            ((let x = () in
            let _v : 'tv_option_SEMI_COLON_ = 
# 116 "<standard.mly>"
    ( Some x )
# 269 "parser.ml"
             in
            _menhir_goto_option_SEMI_COLON_ _menhir_env _menhir_stack _v) : 'freshtv168)) : 'freshtv170)
        | RIGHT_BRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv171) = Obj.magic _menhir_stack in
            ((let _v : 'tv_option_SEMI_COLON_ = 
# 114 "<standard.mly>"
    ( None )
# 278 "parser.ml"
             in
            _menhir_goto_option_SEMI_COLON_ _menhir_env _menhir_stack _v) : 'freshtv172)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv173 * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)) : 'freshtv176)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv179 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 293 "parser.ml"
        ))) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv177 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 307 "parser.ml"
            ))) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)) : 'freshtv180)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv183 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 316 "parser.ml"
        ))) * _menhir_state * 'tv_term)) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv181 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 322 "parser.ml"
        ))) * _menhir_state * 'tv_term)) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), (v : (
# 9 "parser.mly"
       (string)
# 327 "parser.ml"
        ))), _, (t1 : 'tv_term)), _, (t2 : 'tv_term)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_term = 
# 40 "parser.mly"
                                                  ( Let (v, t1, t2) )
# 335 "parser.ml"
         in
        _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v) : 'freshtv182)) : 'freshtv184)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv191 * _menhir_state) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RIGHT_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv187 * _menhir_state) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv185 * _menhir_state) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (t : 'tv_term)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_aterm = 
# 44 "parser.mly"
                                                  ( t )
# 356 "parser.ml"
             in
            _menhir_goto_aterm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv186)) : 'freshtv188)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv189 * _menhir_state) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)) : 'freshtv192)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv197 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 371 "parser.ml"
        ))) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | SS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv193 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 383 "parser.ml"
            ))) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DEFAULT ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | EOF ->
                _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | EXTEND ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | FLOAT _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
            | FUN ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | INT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
            | LABEL _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
            | LEFT_BRACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | LEFT_PAREN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | LET ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | PROJ ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | STRING _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54) : 'freshtv194)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv195 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 423 "parser.ml"
            ))) * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)) : 'freshtv198)
    | MenhirState0 | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv205 * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv201 * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv199 * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (t : 'tv_term)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_final_decl = 
# 37 "parser.mly"
                                                  ( t )
# 443 "parser.ml"
             in
            _menhir_goto_final_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv200)) : 'freshtv202)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv203 * _menhir_state * 'tv_term) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)) : 'freshtv206)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_fields : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_fields -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv145 * _menhir_state * (
# 9 "parser.mly"
       (string)
# 469 "parser.ml"
        ))) * _menhir_state * 'tv_term)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_fields) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv143 * _menhir_state * (
# 9 "parser.mly"
       (string)
# 477 "parser.ml"
        ))) * _menhir_state * 'tv_term)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((r : 'tv_fields) : 'tv_fields) = _v in
        ((let ((_menhir_stack, _menhir_s, (l : (
# 9 "parser.mly"
       (string)
# 484 "parser.ml"
        ))), _, (t : 'tv_term)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_fields = 
# 65 "parser.mly"
                                                   ( Record (l, t, r) )
# 491 "parser.ml"
         in
        _menhir_goto_fields _menhir_env _menhir_stack _menhir_s _v) : 'freshtv144)) : 'freshtv146)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv155 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_fields) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((r : 'tv_fields) : 'tv_fields) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_record = 
# 62 "parser.mly"
                                                   ( r )
# 508 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_record) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv149) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_record) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((r : 'tv_record) : 'tv_record) = _v in
        ((let _v : 'tv_sterm = 
# 56 "parser.mly"
                                                   ( r )
# 525 "parser.ml"
         in
        _menhir_goto_sterm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv148)) : 'freshtv150)) : 'freshtv152)) : 'freshtv154)) : 'freshtv156)
    | _ ->
        _menhir_fail ()

and _menhir_goto_aterm : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_aterm -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129 * _menhir_state * 'tv_sterm) * _menhir_state * 'tv_aterm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv127 * _menhir_state * 'tv_sterm) * _menhir_state * 'tv_aterm) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (t1 : 'tv_sterm)), _, (t2 : 'tv_aterm)) = _menhir_stack in
        let _v : 'tv_aterm = 
# 46 "parser.mly"
                                                  ( App (t1, t2) )
# 544 "parser.ml"
         in
        _menhir_goto_aterm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv128)) : 'freshtv130)
    | MenhirState0 | MenhirState52 | MenhirState54 | MenhirState9 | MenhirState42 | MenhirState10 | MenhirState13 | MenhirState34 | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133 * _menhir_state * 'tv_aterm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state * 'tv_aterm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (t : 'tv_aterm)) = _menhir_stack in
        let _v : 'tv_term = 
# 41 "parser.mly"
                                                  ( t )
# 556 "parser.ml"
         in
        _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v) : 'freshtv132)) : 'freshtv134)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv137 * _menhir_state) * _menhir_state * 'tv_aterm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RIGHT_PAREN ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv135 * _menhir_state) * _menhir_state * 'tv_aterm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)) : 'freshtv138)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv141 * _menhir_state) * _menhir_state * 'tv_aterm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RIGHT_PAREN ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv139 * _menhir_state) * _menhir_state * 'tv_aterm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)) : 'freshtv142)
    | _ ->
        _menhir_fail ()

and _menhir_goto_decl : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_decl -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv115 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 600 "parser.ml"
        ))) * _menhir_state * 'tv_term)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_decl) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv113 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 608 "parser.ml"
        ))) * _menhir_state * 'tv_term)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((t2 : 'tv_decl) : 'tv_decl) = _v in
        ((let (((_menhir_stack, _menhir_s), (v : (
# 9 "parser.mly"
       (string)
# 615 "parser.ml"
        ))), _, (t1 : 'tv_term)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_decl = 
# 32 "parser.mly"
                                                 ( Let (v, t1, t2) )
# 623 "parser.ml"
         in
        _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv114)) : 'freshtv116)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_decl) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv123) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((t : 'tv_decl) : 'tv_decl) = _v in
        ((let _v : (
# 25 "parser.mly"
      (HindleyMilner.term)
# 638 "parser.ml"
        ) = 
# 29 "parser.mly"
                                                 ( t )
# 642 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 25 "parser.mly"
      (HindleyMilner.term)
# 650 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 25 "parser.mly"
      (HindleyMilner.term)
# 658 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv117) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 25 "parser.mly"
      (HindleyMilner.term)
# 666 "parser.ml"
        )) : (
# 25 "parser.mly"
      (HindleyMilner.term)
# 670 "parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv118)) : 'freshtv120)) : 'freshtv122)) : 'freshtv124)) : 'freshtv126)
    | _ ->
        _menhir_fail ()

and _menhir_run5 : _menhir_env -> 'ttv_tail * _menhir_state -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv111 * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _2 = () in
    let _1 = () in
    let _v : 'tv_sterm = 
# 52 "parser.mly"
                                                   ( Unit )
# 688 "parser.ml"
     in
    _menhir_goto_sterm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv112)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv109) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fields = 
# 67 "parser.mly"
                                                   ( Unit )
# 702 "parser.ml"
     in
    _menhir_goto_fields _menhir_env _menhir_stack _menhir_s _v) : 'freshtv110)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (string)
# 709 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105 * _menhir_state * (
# 9 "parser.mly"
       (string)
# 721 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEFAULT ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | EXTEND ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | FLOAT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | FUN ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | INT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | LABEL _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | LEFT_BRACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | LEFT_PAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | PROJ ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13) : 'freshtv106)
    | DEFAULT | EXTEND | FLOAT _ | FUN | INT _ | LABEL _ | LEFT_BRACE | LEFT_PAREN | PROJ | RIGHT_BRACE | SEMI_COLON | STRING _ ->
        _menhir_reduce17 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv107 * _menhir_state * (
# 9 "parser.mly"
       (string)
# 761 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)

and _menhir_reduce17 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 9 "parser.mly"
       (string)
# 769 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (v : (
# 9 "parser.mly"
       (string)
# 775 "parser.ml"
    ))) = _menhir_stack in
    let _v : 'tv_sterm = 
# 51 "parser.mly"
                                                   ( Var v )
# 780 "parser.ml"
     in
    _menhir_goto_sterm _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LABEL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 9 "parser.mly"
       (string)
# 796 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv97 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 807 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DEFAULT ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | EXTEND ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | FLOAT _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
            | FUN ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | INT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
            | LABEL _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
            | LEFT_BRACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | LEFT_PAREN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | PROJ ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | STRING _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9) : 'freshtv98)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv99 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 845 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)) : 'freshtv102)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)

and _menhir_goto_sterm : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_sterm -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv77 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 866 "parser.ml"
        )) * _menhir_state * 'tv_sterm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEFAULT ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | EXTEND ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | FLOAT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | INT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | LABEL _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | LEFT_BRACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | LEFT_PAREN ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | PROJ ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24) : 'freshtv78)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv81 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 898 "parser.ml"
        )) * _menhir_state * 'tv_sterm) * _menhir_state * 'tv_sterm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv79 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 904 "parser.ml"
        )) * _menhir_state * 'tv_sterm) * _menhir_state * 'tv_sterm) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), (l : (
# 9 "parser.mly"
       (string)
# 909 "parser.ml"
        ))), _, (t1 : 'tv_sterm)), _, (t2 : 'tv_sterm)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_sterm = 
# 59 "parser.mly"
                                                   ( Default (l, t1, t2) )
# 915 "parser.ml"
         in
        _menhir_goto_sterm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv80)) : 'freshtv82)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv83 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 923 "parser.ml"
        )) * _menhir_state * 'tv_sterm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEFAULT ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState27
        | EXTEND ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState27
        | FLOAT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | INT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | LABEL _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | LEFT_BRACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState27
        | LEFT_PAREN ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState27
        | PROJ ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState27
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27) : 'freshtv84)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv87 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 955 "parser.ml"
        )) * _menhir_state * 'tv_sterm) * _menhir_state * 'tv_sterm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv85 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 961 "parser.ml"
        )) * _menhir_state * 'tv_sterm) * _menhir_state * 'tv_sterm) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), (l : (
# 9 "parser.mly"
       (string)
# 966 "parser.ml"
        ))), _, (t1 : 'tv_sterm)), _, (t2 : 'tv_sterm)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_sterm = 
# 58 "parser.mly"
                                                   ( Extend (l, t1, t2) )
# 972 "parser.ml"
         in
        _menhir_goto_sterm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv86)) : 'freshtv88)
    | MenhirState0 | MenhirState52 | MenhirState54 | MenhirState4 | MenhirState6 | MenhirState9 | MenhirState42 | MenhirState10 | MenhirState13 | MenhirState34 | MenhirState30 | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state * 'tv_sterm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEFAULT ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | EXTEND ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | FLOAT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | FUN ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | INT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | LABEL _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | LEFT_BRACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | LEFT_PAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | PROJ ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | EOF | IN | RIGHT_BRACE | RIGHT_PAREN | SEMI_COLON | SS ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv89 * _menhir_state * 'tv_sterm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (t : 'tv_sterm)) = _menhir_stack in
            let _v : 'tv_aterm = 
# 47 "parser.mly"
                                                  ( t )
# 1008 "parser.ml"
             in
            _menhir_goto_aterm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv90)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30) : 'freshtv92)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv95 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1020 "parser.ml"
        )) * _menhir_state * 'tv_sterm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv93 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1026 "parser.ml"
        )) * _menhir_state * 'tv_sterm) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), (l : (
# 9 "parser.mly"
       (string)
# 1031 "parser.ml"
        ))), _, (t : 'tv_sterm)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_sterm = 
# 57 "parser.mly"
                                                   ( Proj (l, t) )
# 1037 "parser.ml"
         in
        _menhir_goto_sterm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv94)) : 'freshtv96)

and _menhir_goto_final_decl : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_final_decl -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv75) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_final_decl) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv73) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((t : 'tv_final_decl) : 'tv_final_decl) = _v in
    ((let _v : 'tv_decl = 
# 33 "parser.mly"
                                                 ( t )
# 1054 "parser.ml"
     in
    _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv74)) : 'freshtv76)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEFAULT ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | EXTEND ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | FLOAT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | FUN ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | INT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | LABEL _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | LEFT_BRACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | LEFT_PAREN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | PROJ ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | RIGHT_PAREN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv39 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1099 "parser.ml"
        ))) * _menhir_state * 'tv_term)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv41 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1108 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv43 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1117 "parser.ml"
        ))) * _menhir_state * 'tv_term)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv45 * _menhir_state * (
# 9 "parser.mly"
       (string)
# 1126 "parser.ml"
        ))) * _menhir_state * 'tv_term)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * _menhir_state * 'tv_sterm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv49 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1140 "parser.ml"
        )) * _menhir_state * 'tv_sterm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1149 "parser.ml"
        )) * _menhir_state * 'tv_sterm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1158 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1167 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv57 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1176 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * (
# 9 "parser.mly"
       (string)
# 1185 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv63 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1199 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1218 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv72)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 10 "parser.mly"
       (string)
# 1230 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv37) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : (
# 10 "parser.mly"
       (string)
# 1240 "parser.ml"
    )) : (
# 10 "parser.mly"
       (string)
# 1244 "parser.ml"
    )) = _v in
    ((let _v : 'tv_sterm = 
# 55 "parser.mly"
                                                   ( String s )
# 1249 "parser.ml"
     in
    _menhir_goto_sterm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv38)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LABEL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 9 "parser.mly"
       (string)
# 1265 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEFAULT ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | EXTEND ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | FLOAT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | INT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | LABEL _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | LEFT_BRACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | LEFT_PAREN ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | PROJ ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv34)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)

and _menhir_run50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LABEL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 9 "parser.mly"
       (string)
# 1313 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv25 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1324 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DEFAULT ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | EXTEND ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | FLOAT _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | FUN ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | INT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | LABEL _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | LEFT_BRACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | LEFT_PAREN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | PROJ ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | STRING _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52) : 'freshtv26)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv27 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1362 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)) : 'freshtv30)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEFAULT ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | EXTEND ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | FLOAT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | FUN ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | INT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | LABEL _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | LEFT_BRACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | LEFT_PAREN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | PROJ ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | RIGHT_PAREN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEFAULT ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | EXTEND ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | FLOAT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | FUN ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | INT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | LABEL _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | LEFT_BRACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | LEFT_PAREN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | PROJ ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | RIGHT_BRACE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (string)
# 1447 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce17 _menhir_env (Obj.magic _menhir_stack)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 7 "parser.mly"
       (int)
# 1457 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 7 "parser.mly"
       (int)
# 1467 "parser.ml"
    )) : (
# 7 "parser.mly"
       (int)
# 1471 "parser.ml"
    )) = _v in
    ((let _v : 'tv_sterm = 
# 53 "parser.mly"
                                                   ( Int i )
# 1476 "parser.ml"
     in
    _menhir_goto_sterm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LABEL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 9 "parser.mly"
       (string)
# 1492 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARROW ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv15 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1503 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DEFAULT ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | EXTEND ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | FLOAT _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
            | FUN ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | INT _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
            | LABEL _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
            | LEFT_BRACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | LEFT_PAREN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | PROJ ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | STRING _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18) : 'freshtv16)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv17 * _menhir_state) * (
# 9 "parser.mly"
       (string)
# 1541 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)) : 'freshtv20)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (float)
# 1556 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((x : (
# 8 "parser.mly"
       (float)
# 1566 "parser.ml"
    )) : (
# 8 "parser.mly"
       (float)
# 1570 "parser.ml"
    )) = _v in
    ((let _v : 'tv_sterm = 
# 54 "parser.mly"
                                                   ( Float x )
# 1575 "parser.ml"
     in
    _menhir_goto_sterm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv14)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LABEL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 9 "parser.mly"
       (string)
# 1591 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEFAULT ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | EXTEND ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | FLOAT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | INT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | LABEL _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | LEFT_BRACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | LEFT_PAREN ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | PROJ ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21) : 'freshtv10)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)

and _menhir_run55 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_final_decl = 
# 36 "parser.mly"
                                                  ( Unit )
# 1636 "parser.ml"
     in
    _menhir_goto_final_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv8)

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LABEL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv3 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 9 "parser.mly"
       (string)
# 1652 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEFAULT ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | EXTEND ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | FLOAT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | INT _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | LABEL _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | LEFT_BRACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | LEFT_PAREN ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | PROJ ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23) : 'freshtv4)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv5 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv6)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 25 "parser.mly"
      (HindleyMilner.term)
# 1703 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEFAULT ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EOF ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EXTEND ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FLOAT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | FUN ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | LABEL _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | LEFT_BRACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LEFT_PAREN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LET ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PROJ ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 269 "<standard.mly>"
  

# 1754 "parser.ml"
