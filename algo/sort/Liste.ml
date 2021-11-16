{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "f538f3d6-0076-4f9b-9e63-91e4604e1ccc",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val recherche : 'a list -> 'a -> bool = <fun>\n"
      ]
     },
     "execution_count": 2,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "text/plain": [
       "- : bool = true\n"
      ]
     },
     "execution_count": 2,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let rec recherche l n= match l with\n",
    "    |[]-> false\n",
    "    |e::q-> if e=n then true else recherche q n;;\n",
    "recherche [1;2;3] 3"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "1cfbb381-8e8b-42e5-9052-1d8a4ab4bd9e",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val rev : 'a list -> 'a list -> 'a list = <fun>\n"
      ]
     },
     "execution_count": 3,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "text/plain": [
       "- : int list = [3; 2; 1]\n"
      ]
     },
     "execution_count": 3,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let rec rev l acc= match l with\n",
    "    |[]->[]\n",
    "    |e::q-> rev q acc @ e::acc;;\n",
    "rev [1;2;3] []"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "2f1dfb99-e224-4dc3-8e50-369c6c781579",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val croissant : 'a list -> bool = <fun>\n"
      ]
     },
     "execution_count": 4,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "text/plain": [
       "- : bool = true\n"
      ]
     },
     "execution_count": 4,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let rec croissant l= match l with\n",
    "    |[]->true\n",
    "    |[e]->true\n",
    "    |e1::e2::q-> if e1>e2 then false else croissant (e2::q);;\n",
    "croissant[1;2;3;3]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "f4402e26-a208-412b-bb63-b4cfd8d1c37e",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val fusion : 'a list -> 'a list -> 'a list = <fun>\n"
      ]
     },
     "execution_count": 5,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let rec fusion l1 l2 = match l1, l2 with\n",
    "| [], _ -> l2\n",
    "| _, [] -> l1\n",
    "| e1::q1, e2::q2 when e1 < e2 -> e1::fusion q1 l2\n",
    "| e1::q1, e2::q2 -> e2::fusion l1 q2;;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "0eba72c2-0f24-4522-8b08-23d6ec3defa1",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val split : 'a list -> 'a list * 'a list = <fun>\n"
      ]
     },
     "execution_count": 6,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let rec split = function\n",
    "| [] -> [], []\n",
    "| [e] -> [e], []\n",
    "| e1::e2::q -> let q1, q2 = split q in\n",
    "e1::q1, e2::q2;;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "3dc5820e-b350-4eca-9e3b-b095e63ac28d",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val tri : 'a list -> 'a list = <fun>\n"
      ]
     },
     "execution_count": 7,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "text/plain": [
       "- : int list = [1; 3; 4; 5; 6; 7; 8; 9; 9]\n"
      ]
     },
     "execution_count": 7,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let rec tri = function\n",
    "| [] -> []\n",
    "| [e] -> [e] (* tri ne termine pas sans ce cas *)\n",
    "| l -> let l1, l2 = split l in\n",
    "fusion (tri l1) (tri l2);;\n",
    "tri [1;5;9;8;3;4;9;7;6]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "13961d72-df3a-4ed8-94fe-5e9c7b0cd613",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val doublon : 'a list -> bool = <fun>\n"
      ]
     },
     "execution_count": 8,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "text/plain": [
       "- : bool = true\n"
      ]
     },
     "execution_count": 8,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let rec doublon l = match l with\n",
    "| [] -> false\n",
    "| e::q -> List.mem e q || doublon q;;\n",
    "doublon[1;2;2]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "b5b100bf-0a15-4102-9e75-04d5ac67361b",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val partition : 'a list -> 'a -> 'a list * 'a list = <fun>\n"
      ]
     },
     "execution_count": 20,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "text/plain": [
       "- : int list * int list = ([1; 2; 3; 4], [5; 6; 7; 8; 9])\n"
      ]
     },
     "execution_count": 20,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let rec partition l p= match l with\n",
    "    |[]->[],[]\n",
    "    |e::q->let q1, q2= partition q p in\n",
    "        if e < p then (e::q1), q2\n",
    "        else q1, (e::q2);;\n",
    "partition [1;2;3;4;5;6;7;8;9] 5\n",
    "\n",
    "    "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "a5066dfe-e209-46ae-bf45-691e27cd17ba",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val quicksort : 'a list -> 'a list = <fun>\n"
      ]
     },
     "execution_count": 24,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "text/plain": [
       "- : int list = [1; 2; 2; 3; 4; 4; 4; 5; 5; 6; 6; 6; 7; 8; 8; 9; 9; 9; 57; 58]\n"
      ]
     },
     "execution_count": 24,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let rec quicksort= function\n",
    "    |[]->[]\n",
    "    |e::q-> let l1, l2= partition q e in\n",
    "            (quicksort l1) @ (e::quicksort l2);;\n",
    "quicksort [2;5;6;4;9;7;3;2;1;6;8;4;9;57;8;4;9;58;5;6]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "30063459-6d85-4902-a119-a20d385a5d4a",
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
  },
  "toc-autonumbering": true,
  "toc-showcode": true,
  "toc-showtags": true
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
