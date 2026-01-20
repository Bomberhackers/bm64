#!/usr/bin/env python3

def apply(config, args):
    config['baseimg'] = 'baserom.decomp.z64'
    config['myimg'] = 'build/bm64.z64'
    config['mapfile'] = 'build/bm64.map'
    config['source_directories'] = ['.']
    config["objdump_flags"] = ["-Mreg-names=32"]
