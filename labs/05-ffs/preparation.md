# Preparations for the lab 05

## Characteristic equations of D, JK and T flip-flops
![equations](img/equations.png)

## Truth tables of D, JK and T flip-flops
**D-type FF**
   | **clk** | **d** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](img/eq_uparrow.png) | 0 | 0 | 0 | Set `q(n+1)` to 0 |
   | ![rising](img/eq_uparrow.png) | 0 | 1 | 0 | Set `q(n+1)` to 0 |
   | ![rising](img/eq_uparrow.png) | 1 | 0 | 1 | Set `q(n+1)` to 1 |
   | ![rising](img/eq_uparrow.png) | 1 | 1 | 1 | Set `q(n+1)` to 1 |

   **JK-type FF**
   | **clk** | **j** | **k** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-: | :-- |
   | ![rising](img/eq_uparrow.png) | 0 | 0 | 0 | 0 | Output did not change |
   | ![rising](img/eq_uparrow.png) | 0 | 0 | 1 | 1 | Output did not change |
   | ![rising](img/eq_uparrow.png) | 0 | 1 | 0 | 0 | Reset |
   | ![rising](img/eq_uparrow.png) | 0 | 1 | 1 | 0 | Reset |
   | ![rising](img/eq_uparrow.png) | 1 | 0 | 0 | 1 | Set |
   | ![rising](img/eq_uparrow.png) | 1 | 0 | 1 | 1 | Set |
   | ![rising](img/eq_uparrow.png) | 1 | 1 | 0 | 1 | Toggle |
   | ![rising](img/eq_uparrow.png) | 1 | 1 | 1 | 0 | Toggle |

   **T-type FF**
   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](img/eq_uparrow.png) | 0 | 0 | 0 | Output did not change |
   | ![rising](img/eq_uparrow.png) | 0 | 1 | 1 | Output did not change |
   | ![rising](img/eq_uparrow.png) | 1 | 0 | 1 | Toggle |
   | ![rising](img/eq_uparrow.png) | 1 | 1 | 0 | Toggle |