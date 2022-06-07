{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "f91252cf-51bb-479a-bc41-578e3e987da9",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val dicho : 'a array -> 'a -> bool = <fun>\n"
      ]
     },
     "execution_count": 21,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "text/plain": [
       "- : bool = true\n"
      ]
     },
     "execution_count": 21,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let dicho t e=\n",
    "    let rec aux i j=\n",
    "        if i>j then false\n",
    "        else let m= (i+j)/2 in      (*m est au millieu du tableau*)\n",
    "        if t.(m)=e then true\n",
    "        else if t.(m)<e then aux (m+1) j    (*valable seulement si le tableau est trie*)\n",
    "        else aux i (m-1) in                 \n",
    "        aux 0 (Array.length t -1);;\n",
    "dicho [|1;2;3;4;5;6;7|] 6\n",
    "        "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "db3cf371-b8c7-45c8-bb9b-d5be92db5f29",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val tricho : 'a array -> 'a -> bool = <fun>\n"
      ]
     },
     "execution_count": 1,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "text/plain": [
       "- : bool = true\n"
      ]
     },
     "execution_count": 1,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let tricho t e=\n",
    "    let rec aux i j =\n",
    "        if i>j then false\n",
    "        else let m1=(j+2*i+1)/3 in  \n",
    "        let m2= (2*j+i+2)/3 in\n",
    "        if t.(m1)=e || t.(m2)=e then true\n",
    "        else if e<t.(m1) then aux i (m1-1) (*on regarde a gauche, a droite puis dans le dernier cas au millieu,avec un tableau croissant*)\n",
    "        else if e>t.(m2) then aux (m2+1) j\n",
    "        else aux (m1+1) (m2-1) in\n",
    "    aux 0 (Array.length t -1);;\n",
    "tricho [|1;2;3;4;5;6;7|] 6\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "882837d5-1806-4064-868c-b9a5e20039b1",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "- : int = 6\n"
      ]
     },
     "execution_count": 7,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let somme t=\n",
    "    let res= ref 0 in\n",
    "    for i=0 to Array.length t-1 do\n",
    "    res:=!res+ t.(i)\n",
    "    done;\n",
    "    !res in\n",
    "somme [|1;2;3|]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "7dd85ee3-ac6c-4dba-bc38-251fbd2f68da",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "- : int = 3\n"
      ]
     },
     "execution_count": 11,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let maximum t=\n",
    "let m=t.(0) in\n",
    "    let res= ref m in\n",
    "    for i=0 to Array.length t-1 do\n",
    "    if t.(i)> !res then res:=t.(i)\n",
    "    done;\n",
    "    !res in\n",
    "maximum [|1;2;3|]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "d957eb78-6cf3-4bfc-a20d-a5bf89e9418d",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "- : int = 5\n"
      ]
     },
     "execution_count": 3,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let tranche_max t =\n",
    "let m = ref t.(0) in\n",
    "    let m_cur = ref t.(0) in\n",
    "    for i = 1 to Array.length t - 1 do\n",
    "    m_cur := max (!m_cur + t.(i)) t.(i);\n",
    "    m := max !m !m_cur\n",
    "    done;\n",
    "    !m in\n",
    "tranche_max [|1;-2;3;-4;2;3;-2;-7|]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "fb268a81-cf4c-4f45-8604-5363be42b6c4",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val doublon : 'a array -> bool = <fun>\n"
      ]
     },
     "execution_count": 12,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "text/plain": [
       "- : bool = true\n"
      ]
     },
     "execution_count": 12,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let doublon t=\n",
    "    let res= ref false in\n",
    "    let m= ref t.(0) in\n",
    "        for i=1 to Array.length t-1 do\n",
    "        if t.(i)= !m then res:=true else m:= t.(i)\n",
    "        done;\n",
    "        !res;;\n",
    "doublon [|1;2;3;3|]\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "262b6ffa-f026-4270-9771-33c986f6f69a",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val exp_rapide : int -> int -> int = <fun>\n"
      ]
     },
     "execution_count": 4,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "text/plain": [
       "- : int = 8\n"
      ]
     },
     "execution_count": 4,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let rec exp_rapide a n =\n",
    "if n = 0 then 1\n",
    "else let b = exp_rapide a (n/2) in\n",
    "if n mod 2 = 0 then b*b\n",
    "else a*b*b;;\n",
    "exp_rapide 2 3\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "c399e398-5945-4148-8b4b-64d522b52b49",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "OCaml default",
   "language": "OCaml",
   "name": "ocaml-jupyter"
  },
  "language_info": {
   "codemirror_mode": "text/x-ocaml",
   "file_extension": ".ml",
   "mimetype": "text/x-ocaml",
   "name": "OCaml",
   "nbconverter_exporter": null,
   "pygments_lexer": "OCaml",
   "version": "4.08.1"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
