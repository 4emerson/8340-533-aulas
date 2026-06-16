Internet
    │
[Load Balancer] ← Application Load Balancer (Internet-facing)
    │
   VPC (192.168.10.0/24)
    ├── [Web Server 1 — NGINX] ← AZ us-xxx-1a
    └── [Web Server 2 — NGINX] ← AZ us-xxx-1b
```

---

### Passo 1 — Criar a VPC

Acesse **VPC** no console da AWS:

1. Clique em **Create VPC**
2. No campo **Resources to create**, selecione **VPC, subnets, etc.**
3. Em **Name tag auto-generation**, defina um nome (ex: `curso-533`)
4. Em **IPv4 CIDR block** coloque `192.168.10.0/24`
5. Em **IPv6 CIDR block** selecione **No IPv6 CIDR block**
6. Em **Tenancy** mantenha **Default**
7. Em **Availability Zones (AZs)** escolha `2`
8. Em **Number of public subnets** selecione `2`
9. Em **Number of private subnets** selecione `0`
10. Desabilite **VPC endpoints** selecionando **None**
11. Clique em **Create VPC**

> O processo cria automaticamente: 1 VPC, 2 sub-redes públicas, 1 Internet Gateway e 1 Route Table. Aguarde alguns segundos.

---

### Passo 2 — Criar o Launch Template

O Launch Template define as configurações base das instâncias que serão criadas pelo Auto Scaling Group.

Acesse **EC2 → Launch Templates → Create launch template**:

1. Em **Launch template name** digite `debian-us`
2. Em **Launch template contents**, expanda **Application and OS Images (Amazon Machine Image)**
3. Em **Quick Start** procure a imagem **Debian** e selecione-a
4. Expanda **Instance Type** e escolha `t2.micro`
5. Em **Key pair (login)** clique em **Create new key pair**
   - Defina um nome (ex: `curso-533-key`)
   - Clique em **Create key pair** — o download da `.pem` será feito automaticamente
   - **Guarde esta chave** — ela é a única forma de acessar as instâncias via SSH
6. Em **Network settings** expanda **Advanced network configuration** e clique em **Add network interface**
7. Selecione **Enable** em **Auto-assign public IP**
8. Clique em **Create launch template**

---

### Passo 3 — Criar o Auto Scaling Group e o Load Balancer

Acesse **EC2 → Auto Scaling Groups → Create an Auto Scaling group**:

1. Defina um nome em **Auto Scaling group name** (ex: `curso-533-asg`)
2. Em **Launch template**, selecione o template criado anteriormente (`debian-us`)
3. Clique em **Next**
4. Em **Network**, selecione a VPC criada anteriormente
5. Em **Availability Zones and subnets**, selecione as duas sub-redes criadas
6. Clique em **Next**
7. Em **Load balancing**, selecione **Attach to a new load balancer**
8. Em **Load balancer type**, escolha **Application Load Balancer**
9. Defina um nome em **Load balancer name** (ex: `curso-533-alb`)
10. Em **Load balancer scheme**, selecione **Internet-facing**
11. Em **Listeners and routing**, clique em **Default routing (forward to)** → **Create a target group**
12. Defina um nome para o **Target Group** (ex: `curso-533-tg`)
13. Clique em **Next**
14. Em **Group size**, defina **Desired capacity** = `2` e **Maximum capacity** = `2`
15. Clique em **Next** nos próximos passos e, no último, clique em **Create Auto Scaling group**

> Após finalizar, o Auto Scaling Group criará automaticamente 2 instâncias (uma por AZ) usando o Launch Template como base.

Verifique em **EC2 → Instances** — as duas máquinas devem aparecer como **running**.

---

### Passo 4 — Configurar Security Group para acesso SSH

Para acessar as instâncias via SSH, precisamos liberar a porta 22:

1. Em **EC2 → Instances**, clique em uma das instâncias criadas
2. Na aba **Security**, clique no **Security Group** listado (provavelmente `default`)
3. Em **Inbound rules**, clique em **Edit inbound rules** → **Add Rule**
4. Na nova linha, altere **Type** para **All Traffic** e **Source** para **My IP**
5. Clique em **Save rules**

---

### Passo 5 — Instalar NGINX nas instâncias

Repita para cada instância:

1. Acesse **EC2 → Instances** e copie o **IPv4 Public IP** da instância
2. Ajuste as permissões da chave `.pem`:

```bash
chmod 400 ~/Downloads/curso-533-key.pem
```

3. Conecte via SSH:

```bash
ssh -i ~/Downloads/curso-533-key.pem admin@<ip-da-instancia>
```

4. Dentro da instância, instale o NGINX:

```bash
sudo apt-get update
sudo apt-get install nginx -y
```

5. Repita para a segunda instância.

---

### Verificando o resultado

1. Acesse **EC2 → Load Balancers**
2. Clique no Load Balancer criado e copie o **DNS name**
3. Abra o DNS name em um navegador — você verá a tela de boas-vindas do NGINX

**Resultado esperado:** A página "Welcome to nginx!" indicando que o Load Balancer está distribuindo tráfego entre as duas instâncias.
