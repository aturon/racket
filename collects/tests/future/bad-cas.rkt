#lang scheme/base

(require scheme/future)

(let ()
  (define b1 (box #t))
  (define (neg-bad)
    (let loop ()
      (unless (cas-box! b1 #t #f)
	(unless (cas-box! b1 #f #t)
	  (loop)))))

  (displayln "b1:")
  (displayln b1)
  (neg-bad)
  (displayln b1)
  (neg-bad)
  (displayln b1)

  (displayln "")

  (define b2 (box #t))
  (define (neg-good)
    (unless (cas-box! b2 #t #f)
      (cas-box! b2 #f #t)))

  (displayln "b2:")
  (displayln b2)
  (neg-good)
  (displayln b2)
  (neg-good)
  (displayln b2)
)