{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "871fbc3a-b0ae-4893-ae49-22597408e47b",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "type 'a file = {\n",
       "  tab : 'a array;\n",
       "  mutable deb : int;\n",
       "  mutable fin : int;\n",
       "  mutable vide : bool;\n",
       "}\n"
      ]
     },
     "execution_count": 2,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "type 'a file= {tab: 'a array; mutable deb: int; mutable fin: int; mutable vide: bool}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "c5412f1a-4413-42c3-896c-c7ed5feb19bd",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val ajoute : 'a file -> 'a -> unit = <fun>\n"
      ]
     },
     "execution_count": 3,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let ajoute f e=\n",
    "    if f.deb=f.fin && not f.vide then failwith \"file pleine\"\n",
    "    else (f.tab.(f.fin)<-e;\n",
    "        f.fin <- (f.fin+1) mod Array.length f.tab;\n",
    "        f.vide <- false);;\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "f03b48fa-abb3-49db-8437-33db0d20eeb2",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val retire : 'a file -> 'b -> 'a = <fun>\n"
      ]
     },
     "execution_count": 4,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let retire f e=\n",
    "    if f.vide then failwith \"file vide\"\n",
    "    else let res= f.tab.(f.deb) in\n",
    "        (f.deb<-(f.deb+1) mod Array.length f.tab;\n",
    "        f.vide<-f.deb=f.fin;\n",
    "        res);;\n",
    "    "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "dbd3ed6e-4809-4259-9ab7-8c62b26fc553",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "type 'a l2c = { elem : 'a; mutable prev : 'a l2c; mutable next : 'a l2c; }\n"
      ]
     },
     "execution_count": 4,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "type 'a l2c={elem: 'a ; mutable prev:'a l2c; mutable next: 'a l2c};;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "69399355-d7f5-4b78-8196-2bf67124eb2a",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val add : 'a -> 'a l2c -> unit = <fun>\n"
      ]
     },
     "execution_count": 5,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let add e l=\n",
    "    let l_new= {elem=e; prev=l; next= l.next} in\n",
    "    l.next.prev<-l_new;\n",
    "    l.next<-l_new;;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "e2d3cda3-70bd-41c4-8f1f-cfc6f7086cca",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val del : 'a l2c -> unit = <fun>\n"
      ]
     },
     "execution_count": 6,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let del l=\n",
    "    l.prev.next<-l.next;\n",
    "    l.next.prev<-l.prev;;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "8e3157ed-768b-45da-88c4-f0854a6c466a",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val length : 'a l2c -> int = <fun>\n"
      ]
     },
     "execution_count": 7,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let length l=\n",
    "    let rec aux l1=\n",
    "        if l1==l then 1 else 1+ aux l1.next in\n",
    "    aux l.next;;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "c1bac881-0b21-4db6-9da5-ee430bcfb665",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "val mem : 'a -> 'a l2c -> bool = <fun>\n"
      ]
     },
     "execution_count": 9,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "let mem e l=\n",
    "    let cur= ref l.next in\n",
    "    while !cur.elem<> e && !cur != l do\n",
    "        cur := !cur.next\n",
    "    done;\n",
    "    !cur.elem = e;\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "8467704e-3f5a-4fcf-a0e6-afb37ddf15ce",
   "metadata": {},
   "outputs": [],
   "source": [
    "let fusion l1 l2=\n",
    "    (l1.next).prev<-l2;\n",
    "    (l2.next).prev<-l1;\n",
    "    let l1n"
   ]
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
