# freeipa
FreeIPA auth.automata.engineer
Domain: auth.automata.engineer
Environment: Automata Engineer
Document Type: Infrastructure Design / Implementation Planning
Status: Draft

1. Purpose
This document defines the recommended strategy for integrating Linux servers into the FreeIPA domain before implementing Keycloak. The goal is to establish a stable and centralized identity foundation for server authentication, authorization, administrative access control, and policy enforcement across the infrastructure.

This approach ensures that Keycloak is introduced later as an application identity and Single Sign-On layer on top of an already organized and operational identity backend.

2. Objective
The objective of this phase is to:

join Linux servers to the auth.automata.engineer domain

centralize user authentication and group-based access

standardize administrative access to infrastructure

implement centralized sudo and host access control

validate DNS, NTP, Kerberos, and LDAP dependencies

prepare the environment for future Keycloak integration

3. Strategic Rationale
Integrating Linux servers into FreeIPA before implementing Keycloak is recommended for the following reasons:

3.1 Identity Foundation First
FreeIPA provides the core identity services required for Linux infrastructure, including:

centralized users and groups

Kerberos authentication

LDAP directory services

host enrollment and identity management

sudo policy management

host-based access control (HBAC)

SSH access standardization

3.2 Reduced Complexity
If FreeIPA and Keycloak are implemented simultaneously, troubleshooting becomes more difficult because authentication issues may originate from:

DNS resolution

time synchronization

Kerberos configuration

LDAP integration

certificate trust

identity federation settings

application-level SSO configuration

Deploying FreeIPA first isolates the infrastructure identity layer and reduces implementation risk.

3.3 Better Operational Control
By joining servers to FreeIPA first, the organization can define and validate:

hostname conventions

server classification

administrative groups

access rules by environment

sudo delegation model

host access boundaries

This produces a cleaner structure before adding application federation through Keycloak.

3.4 Keycloak and FreeIPA Are Complementary
FreeIPA and Keycloak do not replace each other. They serve different but related purposes:

FreeIPA is responsible for:

Linux identity management

Kerberos and LDAP

host enrollment

sudo policies

HBAC rules

centralized administration of infrastructure hosts

Keycloak is responsible for:

Single Sign-On for web applications

OIDC and SAML federation

MFA for applications

identity brokering

centralized login flows for services and portals

4. Target Outcome
At the end of this phase, the infrastructure should have:

Linux servers joined to auth.automata.engineer

centralized authentication through FreeIPA

defined administrative user groups

defined host groups

centralized sudo rules

host-based access control rules

validated DNS and time synchronization

documented host enrollment standards

a stable base for future Keycloak federation

5. Scope
In Scope
Linux server domain enrollment

FreeIPA client configuration

DNS and hostname validation

NTP/Chrony validation

administrative group design

host group design

sudo policy design

HBAC design

staged host onboarding

documentation and operational standardization

Out of Scope
Keycloak deployment and configuration

application OIDC/SAML onboarding

Windows domain integration

advanced trust relationships with external identity providers

MFA for web applications

full PKI lifecycle expansion beyond immediate FreeIPA trust requirements

6. Prerequisites
Before any server is joined to FreeIPA, the following conditions must be verified.

6.1 DNS Readiness
Each server must correctly resolve:

its own FQDN

the FreeIPA server FQDN

other relevant internal infrastructure hosts

Example records may include:

ipa01.auth.automata.engineer

monitor01.auth.automata.engineer

proxy01.auth.automata.engineer

git01.auth.automata.engineer

6.2 Hostname and FQDN Standards
Each Linux server must have:

a unique hostname

a correct FQDN

no duplicate naming

no generic or temporary hostnames in production

6.3 Time Synchronization
Kerberos requires reliable time synchronization. All servers must use a consistent NTP or Chrony source and remain within acceptable time skew.

6.4 Network Connectivity
Servers must be able to reach the FreeIPA services required for enrollment and operation, including relevant Kerberos, LDAP, DNS, and HTTP/HTTPS communications.

6.5 Local Administrative Recovery
Each server should retain a controlled local administrative account or recovery method to prevent lockout during enrollment or troubleshooting.
