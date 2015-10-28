module ScriniumEsm
  module ViewComponentsHelper
    def scrinium_esm_entries
      return {
        t('scrinium_esm.model') => scrinium_esm.models_path,
        t('activerecord.models.scrinium_esm/experiment') => scrinium_esm.experiments_path,
        t('activerecord.models.scrinium_esm/datum') => scrinium_esm.data_path
      }
    end
  end
end
