#!/bin/bash
option_a() {
    echo "Aktualna data i godzina: $(date)"
}
option_b() {
    echo "Zawartość bieżącego katalogu:"
    ls
}
option_c() {
    echo "Nazwa użytkownika: $USER"
}
option_d() {
    if [ "$1" ]; then
        mkdir "$1"
        echo "Utworzono katalog '$1'."
    else
        echo "Nie podano nazwy katalogu."
    fi
}
option_e() {
    if [ "$1" ]; then
        rm "$1"
        echo "Usunięto plik '$1'."
    else
        echo "Nie podano nazwy pliku."
    fi
}
option_f() {
    if [ "$1" ]; then
        echo "Pierwsze 10 linii pliku '$1':"
        head "$1"
    else
        echo "Nie podano nazwy pliku."
    fi
}
option_g() {
    if [ "$1" ]; then
        echo "Ostatnie 10 linii pliku '$1':"
        tail "$1"
    else
        echo "Nie podano nazwy pliku."
    fi
}
option_h() {
    echo "Skrypt umożliwia wykonanie różnych operacji w bashu. Aby uzyskać więcej informacji, użyj odpowiednich opcji."
}
option_i() {
    num_files=$(ls -l | grep "^-" | wc -l)
    echo "Liczba plików w bieżącym katalogu: $num_files"
}
option_j() {
    echo "Pliki .txt w katalogu:"
    ls *.txt
}
menu() {
    echo "Menu:"
    echo "1. Obliczenie sumy liczb"
    echo "2. Odczytanie zawartości pliku"
    echo "3. Sprawdzenie rodzaju ścieżki"
    echo "4. Zliczenie plików i katalogów"
    echo "5. Wyszukiwanie plików o podanej nazwie"
}
option_1() {
    read -p "Podaj liczbę N: " n
    sum=0
    for ((i=1; i<=n; i++)); do
        ((sum+=i))
    done
    echo "Suma liczb od 1 do $n: $sum"
}
option_2() {
    read -p "Podaj nazwę pliku: " filename
    if [ -f "$filename" ]; then
        tac "$filename"
    else
        echo "Podany plik nie istnieje."
    fi
}
option_k3() {
    read -p "Podaj ścieżkę: " path
    if [ -e "$path" ]; then
        if [ -d "$path" ]; then
            echo "'$path' jest katalogiem."
        elif [ -f "$path" ]; then
            echo "'$path' jest plikiem."
        fi
    else
        echo "Podana ścieżka nie istnieje."
    fi
}
option_k4() {
    num_files=$(ls -l | grep "^-" | wc -l)
    num_dirs=$(ls -l | grep "^d" | wc -l)
    echo "Liczba plików: $num_files"
    echo "Liczba katalogów: $num_dirs"
}
option_k5() {
    read -p "Podaj nazwę pliku: " filename
    echo "Znalezione pliki o nazwie '$filename':"
    find . -name "$filename"
}
if [ $# -eq 0 ]; then
    echo "Podaj opcję. Użyj '-h' aby wyświetlić pomoc."
    exit 1
fi
if [ "$1" = "-k" ]; then
    menu
    read -p "Wybierz opcję z menu (1-5): " choice
    case "$choice" in
        1) option_k1 ;;
        2) option_k2 ;;
        3) option_k3 ;;
        4) option_k4 ;;
        5) option_k5 ;;
        *) echo "Niepoprawny wybór." ;;
    esac
    exit 0
fi
case "$1" in
    -a) option_a ;;
    -b) option_b ;;
    -c) option_c ;;
    -d) option_d "$2" ;;
    -e) option_e "$2" ;;
    -f) option_f "$2" ;;
    -g) option_g "$2" ;;
    -h) option_h ;;
    -i) option_i ;;
    -j) option_j ;;
    *) echo "Niepoprawna opcja. Użyj '-h' aby wyświetlić pomoc." ;;
esac

