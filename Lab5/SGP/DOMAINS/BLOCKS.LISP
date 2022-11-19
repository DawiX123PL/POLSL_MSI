(in-package :domains)


(define (domain blocks)
  (:requirements :strips :equality :typing :conditional-effects :uncertainty)
  (:constants Table)
  (:predicates (on ?x ?y)
	       (clear ?x)
	       (block ?b)
	       )
  ;; Define step for placing one block on another.

  (:action puton
	     :parameters (?X ?Y ?Z)
	     :precondition (and (on ?X ?Z) (clear ?X) (clear ?Y)
				 (not (= ?Y ?Z)) (not (= ?X ?Z))
				 (not (= ?X ?Y)) (not (= ?X Table)))
	     :effect
	     (and (on ?X ?Y) (not (on ?X ?Z))
		   (when (not (= ?Z Table)) (clear ?Z))
		   (when (not (= ?Y Table)) (not (clear ?Y))))))

(define (problem 3blocks)
  (:domain blocks)
  (:objects A B)
  (:init (and (clear Table) (A Table) 
		(on B Table) (clear A) (clear B)))
  (:goal (on A B)))
