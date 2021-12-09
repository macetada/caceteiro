#!/usr/bin/env python3

import argparse
import os
import sys
from enum import Enum


class Profiler(Enum):
    ab = 'ab'
    wrk = 'wrk'


def main():
    h = sys.argv[1]
    if not h:
        os.exit('missing host')
    parser = argparse.ArgumentParser()
    parser.add_argument('-c', type=int, default=100)
    parser.add_argument('-r', type=int, default=10000)
    parser.add_argument('-p', type=Profiler, default=Profiler.ab)
    args = parser.parse_args(sys.argv[2:])

    match args.p:
        case Profiler.ab:
            os.system(f'ab -k -c {args.c} -n {args.r} {h}/')
        case Profiler.wrk:
            os.system(f'wrk -t {args.c} -c {args.r} --latency {h}/')
        case _:
            parser.error(f'{args.p!r} not yet implemented')


if __name__ == '__main__':
    main()
