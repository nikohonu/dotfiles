#!/bin/python
import pathlib
import janome.tokenizer
import glob
import json
import appdirs
import argparse
import re
import nltk
from numpy.typing import _16Bit

config_path = pathlib.Path(appdirs.user_data_dir('mcenw', 'nikohonu') + '/data.json')

def load_settings():
    print(config_path)
    if config_path.exists():
        with open(config_path, 'r') as f:
            data = json.load(f)
        return data
    else:
        return []

def save_settings(data):
    config_path.parent.mkdir(parents=True, exist_ok=True)
    with open(config_path, 'w') as f:
        json.dump(data, f, ensure_ascii=False)

def get_sentence_from_srt(path):
    data = pathlib.Path(path).read_text()
    result = ''
    for line in data.split('\n'):
        if line.isnumeric():
            pass
        elif line.find('-->') != -1:
            pass
        elif len(line) == 0:
            pass
        else:
            result += line.replace(' ', '') + '\n'
    return result.split('\n')

def get_files():
    for file in glob.glob('*.srt'):
        yield file

def get_lines(path):
    data = pathlib.Path(path).read_text()
    data = re.sub(r'<[^>]*>', '', data)
    data = re.sub(r'\{.+?\}', '', data)
    for line in data.split('\n'):
        if line.isnumeric():
            pass
        elif line.find('-->') != -1:
            pass
        elif len(line) == 0:
            pass
        else:
            yield line

exclude_word = ['l', '.']

def is_number(s):
    try:
        float(s) # for int, long and float
    except ValueError:
        try:
            complex(s) # for complex
        except ValueError:
            return False

    return True


def main():
    parser = argparse.ArgumentParser(description='Get most popular English words from *.srt in current dir.')
    parser.add_argument("-a", "--add", type=str, help="add word to known words")
    parser.add_argument("-m", "--all", help="add words to known words", action='store_true')
    args = parser.parse_args()
    known_words = load_settings()
    if args.add:
        known_words.append(args.add)
    else: 
        top = {}
        for file in get_files():
            for line in get_lines(file):
                for token in nltk.word_tokenize(line):
                    if token not in known_words and not is_number(token):
                        if token in top:
                            top[token][0] += 1
                            top[token][1].append(line)
                        else:
                            top[token] = [1, [line]]
        print("top")
        top = list(top.items())
        top.sort(key=lambda i: i[1][0], reverse=True)
        for word in top[:10]:
            print(f'{word[1][0]} - "{word[0]}", {word[1][1][:5]}')
        if args.all:
            for word in top[:10]:
                known_words.append(word[0])
    save_settings(known_words)

if __name__ == '__main__':
    main()
