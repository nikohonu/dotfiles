#!/bin/python
import pathlib
import janome.tokenizer
import glob
import json
import appdirs
import argparse

config_path = pathlib.Path(appdirs.user_data_dir('mcjpw', 'nikohonu') + '/data.json')

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
    
def main():
    parser = argparse.ArgumentParser(description='Get most popular Japanese words from *.srt in current dir.')
    parser.add_argument("-a", "--add", type=str, help="add word to known words")
    args = parser.parse_args()
    known_words = load_settings()
    if args.add:
        known_words.append(args.add)
    else: 
        senetences = []
        for file in glob.glob('*.srt'):
            senetences += get_sentence_from_srt(file)
        top = {}
        t = janome.tokenizer.Tokenizer()
        for senetence in [s for s in senetences if len(s) > 0]:
            for token in t.tokenize(senetence, wakati=True):
                if token not in known_words:
                    if token in top:
                        top[token][0] += 1
                        top[token][1].append(senetence)
                    else:
                        top[token] = [1, [senetence]]
        print("top")
        top = list(top.items())
        top.sort(key=lambda i: i[1][0], reverse=True)
        for word in top[:10]:
            print(f'{word[1][0]} - "{word[0]}", {word[1][1][:5]}')
    save_settings(known_words)

if __name__ == '__main__':
    main()
