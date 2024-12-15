# DAO PROTOCOL MOON

**DAO PROTOCOL MOON** es un proyecto de prueba diseñado para explorar y comprender el funcionamiento y la creación de una DAO (Organización Autónoma Descentralizada) utilizando Solidity, Foundry como marco de desarrollo, y desplegándolo en una red de prueba. Este protocolo permite experimentar con las funcionalidades esenciales de una DAO, incluyendo votaciones, gobernanza y gestión de propuestas.

## Tabla de Contenido

1. [Contexto del Proyecto](#contexto-del-proyecto)
2. [Tecnologías y Herramientas](#tecnologías-y-herramientas)
3. [Instalación y Configuración](#instalación-y-configuración)
4. [Compilación y Ejecución de Tests](#compilación-y-ejecución-de-tests)
5. [Despliegue](#despliegue)
6. [Uso del Proyecto](#uso-del-proyecto)
7. [Arquitectura del Proyecto](#arquitectura-del-proyecto)
8. [Mejores Prácticas y Seguridad](#mejores-prácticas-y-seguridad)
9. [Contribuciones](#contribuciones)
10. [Licencia](#licencia)
11. [Recursos Adicionales](#recursos-adicionales)

---

## Contexto del Proyecto

Las DAOs representan un modelo revolucionario de organización basado en contratos inteligentes. Este proyecto sirve como una introducción práctica al desarrollo de una DAO, abordando conceptos como:

- **Propuestas y Votaciones:** Los participantes pueden crear y votar propuestas para tomar decisiones.
- **Gobernanza Descentralizada:** Permite a los participantes interactuar de manera segura sin intermediarios.
- **Sostenibilidad:** Un sistema transparente que opera en redes blockchain.

**Objetivo:** Desplegar un contrato inteligente de DAO en una testnet y aprender los flujos clave del desarrollo de smart contracts.

## Tecnologías y Herramientas

Este proyecto utiliza las siguientes tecnologías:

- **Solidity:** Lenguaje de programación para contratos inteligentes (versión recomendada: `^0.8.19`).
- **Foundry:** Framework para desarrollo, pruebas y despliegue:
  - `forge` para compilación y pruebas.
  - `anvil` como red local de pruebas.
- **OpenZeppelin:** Librerías de contratos reutilizables para seguridad y optimización.
- **Testnet:** Se recomienda usar Goerli o Sepolia para el despliegue inicial.

## Instalación y Configuración

### Requisitos previos

1. **Node.js y npm:** Para gestionar dependencias si es necesario.
2. **Foundry:** Instálalo siguiendo los pasos oficiales:
   ```bash
   curl -L https://foundry.paradigm.xyz | bash
   foundryup
   ```
3. **Cliente RPC:** Acceso a un proveedor de nodo como Alchemy o Infura para testnets.

### Clonar el repositorio

```bash
git clone [URL_DEL_REPOSITORIO]
cd dao-protocol-moon
```

### Instalar dependencias

```bash
forge install
```

### Configurar variables de entorno

Crea un archivo `.env` con las siguientes claves:

```
PRIVATE_KEY=<tu_llave_privada>
RPC_URL=<url_de_tu_proveedor_rpc>
ETHERSCAN_API_KEY=<clave_para_verificación>
```

## Compilación y Ejecución de Tests

### Compilar contratos

Ejecuta el siguiente comando para compilar los contratos:

```bash
forge build
```

### Ejecutar pruebas

Para ejecutar pruebas y validar la funcionalidad:

```bash
forge test
```

**Salida esperada:**

- Todos los tests deben pasar con mensajes de éxito.
- Logs detallados de las ejecuciones y cualquier fallo si ocurre.

## Despliegue

### Red local

1. Ejecuta una red local con `anvil`:

   ```bash
   anvil
   ```

2. Ejecuta el script de despliegue:

   ```bash
   forge script script/Deploy.s.sol --fork-url http://127.0.0.1:8545 --broadcast
   ```

### Testnet (Goerli o Sepolia)

Para desplegar en una testnet, usa el siguiente comando:

```bash
forge script script/Deploy.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast --verify
```

**Nota:** Asegúrate de tener fondos en tu cuenta de prueba para cubrir las tarifas de gas.

## Uso del Proyecto

### Interacción con la DAO

1. Crear una propuesta:

   ```bash
   forge script script/CreateProposal.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
   ```

2. Votar una propuesta:

   ```bash
   forge script script/VoteProposal.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
   ```

3. Consultar el estado de una propuesta:

   Utiliza un cliente como `cast` o un script personalizado.

## Arquitectura del Proyecto

### Estructura de Directorios

```
├── contracts
│   ├── DAO.sol          # Lógica principal de la DAO
│   └── GovernanceToken.sol  # Token de gobernanza
├── scripts
│   ├── Deploy.s.sol     # Script para despliegue
│   ├── CreateProposal.s.sol  # Script para crear propuestas
│   └── VoteProposal.s.sol  # Script para votar propuestas
├── test
│   └── DAO.t.sol        # Pruebas unitarias para la DAO
```

### Diseño del Contrato DAO

- **DAO.sol:** Implementa funciones para:
  - Crear propuestas.
  - Votar y ejecutar decisiones.
- **GovernanceToken.sol:** Un token ERC-20 utilizado para otorgar derechos de votación.

## Mejores Prácticas y Seguridad

- **Validación de Propuestas:** Asegúrate de que solo participantes autorizados puedan crear y votar.
- **Prevención de Reentrancy:** Usa `modifiers` como `nonReentrant`.
- **Auditoría:** Realiza una revisión exhaustiva del código antes de desplegarlo en mainnet.

## Contribuciones

1. Haz un fork del repositorio.
2. Crea una rama para tu funcionalidad:

   ```bash
   git checkout -b feature/nueva-funcionalidad
   ```

3. Envía un pull request con una descripción detallada de tus cambios.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.

## Recursos Adicionales

- [Documentación de Solidity](https://soliditylang.org/)
- [Foundry Book](https://book.getfoundry.sh/)
- [OpenZeppelin Contracts](https://openzeppelin.com/contracts/)
- [Tutoriales de DAOs en Ethereum](https://ethereum.org/en/dao/)

---

**Contacto:** Si tienes dudas o sugerencias, abre un issue o contáctanos directamente.

