##with open("teste.txt", 'w') as f:
##    for x in range(2):
##        f.writelines("INSERT INTO `pi_campaign` (`id`, `deleted`, `appealBegin`, `appealEnabled`, `appealEnd`, `classificationBanner`, `classificationBtnText`, `closed`, `deactivationAlertEnabled`, `description`, `dummyInstitution`, `institutionGroupRanked`, `institutionRanked`, `labelDeactivationInstitutionText`, `labelDeactivationInstitutionTooltip`, `labelDeactivationUserText`, `labelDeactivationUserTooltip`, `labelDummyInstitution`, `labelInstitutionGroup`, `labelInstitutionSelection`, `labelMyInstitution`, `labelRules`, `participativeEvaluated`, `title`, `userRanked`, `company_id`, `rules_id`) VALUES\n")
##    f.write('deleted\n')
##    f.write('deleted\n')
##

busca = []
querie = ''

with open("proidea_dev1.sql") as ler:
    with open("proidea_querie.sql","w+") as escrever:
        busca = ler.readline()
        
        while(busca != ''):
            achou = busca.find("INTO")
            if(achou>0):
                querie = busca + ler.readline()
                querie = querie.replace("`",'')
                escrever.write(querie)
            busca = ler.readline()
