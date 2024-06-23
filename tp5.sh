num_aleatorio=$((RANDOM % 100 + 1))

echo "El número aleatorio ha sido generado entre 1 y 100."

intentos=0
adivinado=0

while [ $adivinado -eq 0 ]; do
    echo -n "Introduce tu suposición (entre 1 y 100): "
    read suposicion

    if ! [[ "$suposicion" =~ ^[0-9]+$ ]]; then
        echo "Error: Debes ingresar un número válido."
        continue
    fi

    if [ $suposicion -lt 1 ] || [ $suposicion -gt 100 ]; then
        echo "Error: El número debe estar entre 1 y 100."
        continue
    fi

    ((intentos++))

    if [ $suposicion -eq $num_aleatorio ]; then
        echo "¡Felicidades! Has adivinado el número $num_aleatorio en $intentos intentos."
        adivinado=1
    elif [ $suposicion -lt $num_aleatorio ]; then
        echo "El número es más alto."
    else
        echo "El número es más bajo."
    fi
done

echo "Gracias por jugar."